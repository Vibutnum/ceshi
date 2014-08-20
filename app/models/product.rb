class Product < ActiveRecord::Base
  attr_accessible :brand, :category1_name, :category2_name, :color, :created_at, :image_url, :name, :price, :target

  def self.cache
    @category1_name ||= Product.select("category1_name").group("category1_name")
    @category2_name ||= Product.select("category2_name").group("category2_name")
    @brand ||= Product.select("brand").group("brand")
    @color ||= Product.select("color").group("color")
    @target ||= Product.select("target").group("target")
    return @category1_name, @category2_name, @brand, @color, @target
  end

  def show_large_img
  	image_url.split(".thumb145.jpg")[0]
  end


  def self.search(query)
    #搜索
    conditions = [[]]
    checks_arr = query[:check].keys if query[:check].present?
    p checks_arr
    if checks_arr.present?
      if query[:where].present?
        query[:where].each do |k, v|
          p k,v
          p v.blank? || !checks_arr.include?(k)
          next if v.blank? || !checks_arr.include?(k)
          if ['category1_name', 'category2_name', 'brand', 'color', 'target'].include?(k)
            conditions[0] << "products.#{k} = ?"
            conditions << v
          elsif 'price' == k
            arr = v.split(",")
            conditions[0] << "products.price >= ? and products.price <= ?"
            conditions << arr[0].to_i
            conditions << arr[1].to_i
          end
        end
      end
    end
    conditions[0] = conditions[0].join(" AND ")
    #排序
    sort_second = []
    if query[:sort].present?
      query[:sort].each do |k, v|
        if sort_first = ((v == "up") ?  "ASC" : "DESC")
          sort_second << "#{k} #{sort_first}"
        end
      end
    end
    self.where(conditions).order(sort_second.join(","))
  end
end

