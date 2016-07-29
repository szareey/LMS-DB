class SchoolPdfController < ApplicationController
  
  def make
    @user = current_user
    @pdf_form = PdfForms.new
    @path_to_form = ('')
    @field_names = @pdf_form.get_field_names('/Users/Sana/lighthouse/finalproject/lms/lib/pdf_templates/test_form.pdf')
    @pdf_form.fill_form '/Users/Sana/lighthouse/finalproject/lms/lib/pdf_templates/test_form.pdf', 'new_form.pdf', 
      first_name: current_user.first_name,
      last_name: current_user.last_name
    redirect_to :root
  end

end