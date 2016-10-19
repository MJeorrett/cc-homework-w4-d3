require_relative('../db/sql_runner')

require('pry-byebug')

class Table

  attr_reader :database_name, :table_name, :columns_data

  def initialize( database_name, table_name )
    @database_name = database_name
    @table_name = table_name
    self.fetch_table_data()
  end

  def fetch_table_data()
    sql = "SELECT * FROM #{@database_name}.information_schema.columns WHERE table_name = '#{@table_name}'"
    results = SqlRunner.run( @database_name, sql )
    @columns_data = {}

    table_data = results.map do |result|
      column_data = {
        data_type: result['data_type']
      }
      column_name = result['column_name']
      @columns_data[column_name] = column_data
    end

    return table_data
  end

  def new_form_html()
    html = "<form action='/#{@table_name}' method='post'>"
      for column_name in columns()
        if column_name != 'id'
          html += "<label for='#{column_name}'>#{column_name}</label>"
          html += "<input id='#{column_name}' type='text' name='#{column_name}' />"
        end

      end

      html += "<input type='submit' value='Create New #{@table_name}'>"
    html += "</form>"
  end

  def create_record( data )
    save_columns = columns()
    save_columns.delete('id')
    values = save_columns.map { |column| "'#{data[column]}'" }
    sql = "INSERT INTO #{@table_name}(#{save_columns.join(', ')}) VALUES (#{values.join(', ')})"
    SqlRunner.run( @database_name, sql )
  end

  def columns()
    return @columns_data.keys()
  end

end
