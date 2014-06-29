module Jekyll
  class BoatsNavigation < Jekyll::Generator
    def generate(site)
      site.collections.each do |collection_name, collection_content|
        docs = collection_content.docs.sort_by { |doc| doc.data['order'] || doc.data['size'] }

        docs.length.times do |index|
          doc = docs[index]
          doc.data['next'] = docs[(index + 1) % docs.length]
          doc.data['prev'] = docs[(index - 1) % docs.length]
        end
      end
    end
  end
end
