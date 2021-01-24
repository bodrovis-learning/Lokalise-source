module Locale
  extend ActiveSupport::Concern

  private

  def extract_locale(attr = :locale)
    parsed_locale = params[attr]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  included do
    before_action :set_locale
    before_action :set_content_locale

    def set_locale
      I18n.locale = extract_locale || I18n.default_locale
      Mobility.locale = I18n.locale
    end

    def set_content_locale
      Mobility.locale = extract_locale(:content_locale) || I18n.locale
    end

    def default_url_options
      { locale: I18n.locale, content_locale: Mobility.locale }
    end
  end
end