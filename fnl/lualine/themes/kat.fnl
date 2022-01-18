(module lualine.themes.kat
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   main katdotnvim.main
                   }
         require-macros [katdotnvim.utils.macros]
         })

(var kat {})
(var mainFG (groups.mainFG))

(if (and (= vim.o.background :dark)
         (= main.katContrast :soft))
  (do
    (set mainFG (ucolors.brighten (groups.mainFG) 0.8))))

(set kat.normal {:a {:bg (groups.highlightBG)
                     :fg mainFG
                     :gui :bold}
                 :b {:bg (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
                     :fg mainFG}
                 :c {:bg (groups.fillBG)
                     :fg mainFG}})

(set kat.insert {:a {:bg (groups.selectionBG)
                     :fg mainFG
                     :gui :bold}
                 :b {:bg (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
                     :fg mainFG}
                 :c {:bg (ucolors.brighten (groups.selectionBG) 0.2)
                     :fg mainFG}})

(set kat.visual {:a {:bg (groups.errorBG)
                     :fg mainFG
                     :gui :bold}
                 :b {:bg (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
                     :fg mainFG}
                 :c {:bg (groups.highlightBG)
                     :fg mainFG}})

(set kat.replace {:a {:bg (groups.infoBG)
                      :fg mainFG
                      :gui :bold}
                  :b {:bg (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
                      :fg mainFG}
                  :c {:bg (ucolors.brighten (groups.selectionBG) 0.2)
                      :fg mainFG}})

(set kat.command {:a {:bg (ucolors.blendColors (. (colors.init :normalColors) :green) (groups.mainBG) 0.5)
                      :fg mainFG
                      :gui :bold}
                  :b {:bg (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
                      :fg mainFG}
                  :c {:bg (ucolors.blendColors (. (colors.init :normalColors) :green) (groups.mainBG) 0.7)
                      :fg mainFG}})

(set kat.terminal {:a {:bg (ucolors.blendColors (groups.fillBG) (groups.mainBG) 0.8)
                       :fg mainFG
                       :gui :bold}
                   :b {:bg (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
                       :fg mainFG}
                   :c {:bg (ucolors.blendColors (groups.errorBG) (groups.mainBG) 0.8)
                       :fg mainFG}})

(set kat.inactive {:a {:bg (. (colors.init :foreground) 6)
                       :fg (. (colors.init :background) 1)}
                   :b {:bg (. (colors.init :foreground) 6)
                       :fg (. (colors.init :background) 1)}
                   :c {:bg (. (colors.init :foreground) 3)
                       :fg (. (colors.init :background) 1)}})
kat
