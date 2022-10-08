(local ucolors (require :katdotnvim.utils.highlight.utils))
(local colors (require :katdotnvim.color))
(local kat {})

(if (= vim.o.termguicolors true)
  (do
    (tset kat :normal {:a {:bg colors.kat.purple.base.color
                           :fg colors.kat.fg.auto.color
                           :gui :bold}
                       :b {:bg colors.kat.blue.mix_shadow_bg_more.color
                           :fg colors.kat.fg.auto.color}
                       :c {:bg colors.kat.pink.base.color
                           :fg colors.kat.fg.auto.color}})
    (tset kat :insert {:a {:bg colors.kat.blue.base.color
                           :fg colors.kat.fg.auto.color
                           :gui :bold}
                       :b {:bg colors.kat.blue.mix_shadow_bg_more.color
                           :fg colors.kat.fg.auto.color}
                       :c {:bg colors.kat.blue.brighten.color
                           :fg colors.kat.fg.auto.color}})
    (tset kat :visual {:a {:bg colors.kat.red.base.color
                           :fg colors.kat.fg.auto.color
                           :gui :bold}
                       :b {:bg colors.kat.blue.mix_shadow_bg_more.color
                           :fg colors.kat.fg.auto.color}
                       :c {:bg colors.kat.purple.base.color
                           :fg colors.kat.fg.auto.color}})
    (tset kat :replace {:a {:bg colors.kat.orange.base.color
                            :fg colors.kat.fg.auto.color
                            :gui :bold}
                        :b {:bg colors.kat.blue.mix_shadow_bg_more.color
                            :fg colors.kat.fg.auto.color}
                        :c {:bg colors.kat.blue.brighten.color
                            :fg colors.kat.fg.auto.color}})

    (tset kat :command {:a {:bg colors.kat.green.match_bg.color
                            :fg colors.kat.fg.auto.color
                            :gui :bold}
                        :b {:bg colors.kat.blue.mix_shadow_bg_more.color
                            :fg colors.kat.fg.auto.color}
                        :c {:bg colors.kat.green.match_bg_less.color
                            :fg colors.kat.fg.auto.color}})
    (tset kat :terminal {:a {:bg colors.kat.pink.match_bg_less.color
                             :fg colors.kat.fg.auto.color
                             :gui :bold}
                         :b {:bg colors.kat.blue.mix_shadow_bg_more.color
                             :fg colors.kat.fg.auto.color}
                         :c {:bg colors.kat.red.match_bg.color
                             :fg colors.kat.fg.auto.color}})
    (tset kat :inactive {:a {:bg colors.kat.fg.sixth.color
                             :fg colors.kat.bg.base.color}
                         :b {:bg colors.kat.fg.sixth.color
                             :fg colors.kat.bg.base.color}
                         :c {:bg colors.kat.fg.shadow.color
                             :fg colors.kat.bg.base.color}}))
  (do
    (tset kat :normal {:a {:bg 6
                           :fg 7
                           :gui :bold}
                       :b {:bg 12
                           :fg 7}
                       :c {:bg 5
                           :fg 7}})
    (tset kat :insert {:a {:bg 4
                           :fg 7
                           :gui :bold}
                       :b {:bg 12
                           :fg 7}
                       :c {:bg 4
                           :fg 7}})
    (tset kat :visual {:a {:bg 1
                           :fg 7
                           :gui :bold}
                       :b {:bg 12
                           :fg 7}
                       :c {:bg 6
                           :fg 7}})
    (tset kat :replace {:a {:bg 3
                            :fg 7
                            :gui :bold}
                        :b {:bg 4
                            :fg 7}
                        :c {:bg 4
                            :fg 7}})

    (tset kat :command {:a {:bg 2
                            :fg 7
                            :gui :bold}
                        :b {:bg 12
                            :fg 7}
                        :c {:bg 10
                            :fg 7}})
    (tset kat :terminal {:a {:bg 13
                             :fg 7
                             :gui :bold}
                         :b {:bg 12
                             :fg 7}
                         :c {:bg 9
                             :fg 7}})
    (tset kat :inactive {:a {:bg 15
                             :fg 0}
                         :b {:bg 15
                             :fg 0}
                         :c {:bg 15
                             :fg 0}})))
kat
