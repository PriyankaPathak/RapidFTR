module FieldsHelper

  def option_fields_for form, suggested_field
    return [] unless suggested_field.field.option_strings.present?
    suggested_field.field.option_strings.collect do |option_string|
      form.hidden_field("option_strings_text", { :multiple => true, :id => "option_string_" + option_string, :value => option_string+"\n" })
    end
  end

	def display_options field
		field.option_strings.collect { |f| '"'+f+'"' }.join(", ")
	end

	def forms_for_display
	  FormSection.all.sort_by{ |form| form.name || "" }.map{ |form| [form.name, form.unique_id] }
	end
end
