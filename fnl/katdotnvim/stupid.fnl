(module katdotnvim.stupid {autoload {ucolors katdotnvim.utils.highlight.utils
                                     apply katdotnvim.utils.highlight.init
                                     colors katdotnvim.color
                                     syntax katdotnvim.highlights.syntax
                                     a aniseed.core}})

;;; Handles so called 'stupid' features
;;; Name is considered deprecated, but no warning until v2.0

;; fnlfmt: skip
(defn stupidFunction []
  (def timer (vim.loop.new_timer))
  (var i 0)
  (var increase true)

  (timer:start 1 75 
               (vim.schedule_wrap
                 (fn []
                   (let [opts {:group :Function
                               :bg :SKIP
                               :fg (ucolors.saturation
                                     (ucolors.brighten
                                       (ucolors.blend
                                         colors.kat.teal.base.color
                                         colors.kat.red.base.color
                                         (* i 0.1))
                                       0.1)
                                     0.5)
                               :bold true}]
                    (apply.highlight$ opts)
                    (if (= increase true)
                      (set i (+ i 1))
                      (set i (- i 1)))
                    (when (= i 9)
                      (set increase false))
                    (when (= i 0)
                      (set increase true)))))))
