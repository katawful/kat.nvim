(local ucolors (require :katdotnvim.utils.color))
(local colors (require :katdotnvim.color))
(local syntax (require :katdotnvim.highlights.syntax))
(local groups (require :katdotnvim.highlights.main))
(local main (require :katdotnvim.main))
(local mainFG (. (groups.mainFG) 1))

(if (and (= vim.o.background :dark)
         (= main.katContrast :soft))
  (do
    (tset mainFG 1 (ucolors.brighten (. (groups.mainFG) 1) 0.8))))

(local kat {:normal {:a {:bg (. (groups.highlightBG) 1)
                         :fg mainFG
                         :gui :bold}
                     :b {:bg (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
                         :fg mainFG}
                     :c {:bg (. (groups.fillBG) 1)
                         :fg mainFG}}
            :insert {:a {:bg (. (groups.selectionBG) 1)
                         :fg mainFG
                         :gui :bold}
                     :b {:bg (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
                         :fg mainFG}
                     :c {:bg (ucolors.brighten (. (groups.selectionBG) 1) 0.2)
                         :fg mainFG}}
            :visual {:a {:bg (. (groups.errorBG) 1)
                         :fg mainFG
                         :gui :bold}
                     :b {:bg (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
                         :fg mainFG}
                     :c {:bg (. (groups.highlightBG) 1)
                         :fg mainFG}}
            :replace {:a {:bg (. (groups.infoBG) 1)
                          :fg mainFG
                          :gui :bold}
                      :b {:bg (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
                          :fg mainFG}
                      :c {:bg (ucolors.brighten (. (groups.selectionBG) 1) 0.2)
                          :fg mainFG}}

            :command {:a {:bg (ucolors.blendColors (. (colors.init :normalColors) :green) (. (groups.mainBG) 1) 0.5)
                          :fg mainFG
                          :gui :bold}
                      :b {:bg (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
                          :fg mainFG}
                      :c {:bg (ucolors.blendColors (. (colors.init :normalColors) :green) (. (groups.mainBG) 1) 0.7)
                          :fg mainFG}}
            :terminal {:a {:bg (ucolors.blendColors (. (groups.fillBG) 1) (. (groups.mainBG) 1) 0.8)
                           :fg mainFG
                           :gui :bold}
                       :b {:bg (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
                           :fg mainFG}
                       :c {:bg (ucolors.blendColors (. (groups.errorBG) 1) (. (groups.mainBG) 1) 0.8)
                           :fg mainFG}}
            :inactive {:a {:bg (. (colors.init :foreground) 6)
                           :fg (. (colors.init :background) 1)}
                       :b {:bg (. (colors.init :foreground) 6)
                           :fg (. (colors.init :background) 1)}
                       :c {:bg (. (colors.init :foreground) 3)
                           :fg (. (colors.init :background) 1)}}})
kat
