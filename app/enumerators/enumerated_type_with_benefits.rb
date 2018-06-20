module EnumeratedTypeWithBenefits
  def self.included(klass)
    klass.class_eval do
      include EnumeratedType
      extend ClassMethods
      include InstanceMethods
    end
  end

  module ClassMethods
    def include?(name)
      !coerce(name).nil?
    rescue ArgumentError
      false
    end

    def names
      map(&:reference).map(&:to_s)
    end

    def form_options
      map(&:form_option)
    end

    def form_options_for_names(values)
      values
        .map { |value| coerce(value) }
        .map(&:form_option)
    end

    def grouped_select_form_options
      group_by(&:group).map { |group, values| OpenStruct.new(label: group, values: values) }
    end

    def inline_form_options
      Hash[*form_options.flatten].invert
    end

    def inline_form_options_for_names(values)
      Hash[*form_options_for_names(values).flatten].invert
    end

    def labels(items)
      items.map { |item| coerce(item).label }.join(', ')
    end

    def permit_hash_with_arrays
      Hash[*names.flat_map { |name| [name, []] }]
    end

    # Fetches the enum object for the @name argument. If the @name does not
    # exists (not declared on Enum body) it will raise an error. Only difference
    # from coerce method is that fetch does not try to coerce blank @name.
    def fetch(name)
      return if name.blank?
      coerce(name)
    end

    # Overrides coerce method checking if :as param is defined in all enums.
    # When it's defined, we assume that we will find the enum
    # object using this definition.
    def coerce(value)
      if all? { |enum| enum.respond_to?(:as) }
        by(:as, value)
      else
        super(value)
      end
    end

    def fetch_label_or_none_text(value)
      fetch(value)&.label || '-'
    end

    def coerce_list(list)
      list.map { |item| coerce(item) }
    end

    def where(field, value)
      select { |type| type.send(field) == value }
    end
  end

  module InstanceMethods
    def reference
      respond_to?(:as) ? as : name
    end

    def label(count = nil)
      I18n.t(
        "enum.#{self.class.name.underscore}.#{reference}",
        default: reference,
        count: count.presence || 2
      )
    end

    def previous
      self.class.to_a[self.class.find_index(self) - 1] unless first?
    end

    def all_previous
      if first?
        []
      else
        self.class.to_a[0..self.class.find_index(self) - 1]
      end
    end

    def first?
      self.class.to_a.first == self
    end

    def last?
      self.class.to_a.last == self
    end

    def index
      self.class.to_a.find_index(self)
    end

    def <=>(other)
      index <=> other.index
    end

    def next
      self.class.to_a[index + 1]
    end

    def is?(name)
      self.name == name
    end

    def form_option
      [label, reference.to_s]
    end
  end
end
