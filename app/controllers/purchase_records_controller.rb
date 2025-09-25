class PurchaseRecordsController < ApplicationController
  def new
    @purchase_form = PurchaseForm.new
  end
end
