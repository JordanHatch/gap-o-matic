# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

WickedPdf.config = {
  layout: 'layouts/pdf.html.erb',
  orientation: 'Landscape',
  margin: {
    top: 5,
    right: 5,
    bottom: 5,
    left: 5,
  },
  page_size: 'A3',
}
