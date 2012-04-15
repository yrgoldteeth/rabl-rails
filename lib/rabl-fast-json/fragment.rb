require 'active_support/cache'

module RablFastJson
  class Fragment

    attr_reader :compiled_source, :options

    def initialize(key, source, options = {})
      @key = key
      @compiled_source = source
      @options = options
    end

    def expand_cache_key(data)
      @key.call(data)
    end

    def fetch_and_render
      Rails.cache.fetch(key)
    end
  end
end


# def cache(options = {}, &block)
#   return unless block_given?
#   key = options.delete(:key)
#   source = sub_compiler { compile_block(&block) }
#   @template[:"_cache#{cache_count}"] = Fragment.new(key, source, options)
# end

#
# when Fragment
#   render_fragment(value)
#

# def render_fragment(data, fragment)
#   Rails.cache.fetch(fragment.expand_cache_key(data), fragment.options) do
#     render_resource(data, fragment.compiled_source)
#   end
# end