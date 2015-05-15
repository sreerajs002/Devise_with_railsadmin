class ListsPdf < Prawn::Document
  def initialize(lists)
    super()
    @lists = lists
    header
    #text_content
    line_items
   table_content
    
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/icon.png", width: 530, height: 150
  end
 
  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50
 
    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 300) do
      text "Lorem ipsum", size: 15, style: :bold
      text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
    end
 
    bounding_box([300, y_position], :width => 270, :height => 300) do
      text "Duis vel", size: 15, style: :bold
      text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."
    end
 
  end

   def lists_rows
    [['#', 'Name','category','area','Created_at']] +
      @lists.map do |list|
      [list.id, list.listname,list.category.cname, list.area.name,list.created_at.to_s]
    end
   end

  def table_content    
    table lists_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [50, 100, 100,100,180]
    end
  end

  def line_items
    move_down 20    
  end
 

end 