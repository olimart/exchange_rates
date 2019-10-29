# frozen_string_literal: true

class Rate < ApplicationRecord

  # SCOPES
  # ------------------------------------------------------------------------------------------------
  scope :by_currency, ->(base_currency) { where(from_iso_code: base_currency).order('to_iso_code') }


  # ATTRIBUTES
  # ------------------------------------------------------------------------------------------------
  SUPPORTED_CURRENCIES = %w{ cad eur usd jpy gbp aud }


  # VALIDATIONS
  # ------------------------------------------------------------------------------------------------
  validates_presence_of :from_iso_code, :to_iso_code, :rate, :date
  validates_uniqueness_of :from_iso_code, scope: :to_iso_code
  validates_inclusion_of :from_iso_code, in: SUPPORTED_CURRENCIES

end
