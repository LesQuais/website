module Jekyll
  class BoatsNavigation < Jekyll::Generator
    def generate(site)
      boats = site.collections['bateaux'].docs.sort { |a, b| b.data['size'] <=> a.data['size'] }

      boats.length.times do |index|
        boat = boats[index]
        boat.data['next'] = boats[(index + 1) % boats.length]
        boat.data['prev'] = boats[(index - 1) % boats.length]
      end
    end
  end
end
