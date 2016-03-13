require 'html-proofer'

module Jekyll
    module HtmlProofer
        # run after any other hook
        HIGHEST_PRIORITY = Jekyll::Hooks::PRIORITY_MAP[:high] + 1000

        Jekyll::Hooks.register(:site, :post_write, priority: HIGHEST_PRIORITY) do |site|
            # convert string keys to symbols
            config = site.config['html_proofer'] || {}
            config = Hash[config.map{|(k,v)| [k.to_sym,v]}]
            
            begin
                HTMLProofer.check_directory(site.dest, config).run
            rescue Exception => e
                # throwing an exception stops jekyll
                # => catch exceptions while watching
                # => rethrow otherwiese to make jekyll report non-zero exit status
                if site.config['watch']
                    STDERR.puts e
                else
                    raise e
                end
            end
        end
    end
end