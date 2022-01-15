(module katdotnvim.stupid
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   a aniseed.core}})

; this handles stupid features

(defn stupidFunction []
  (def timer (vim.loop.new_timer))
  (var i 0)
  (var increase true)

  (timer:start 1 75 
               (vim.schedule_wrap
                 (fn []
                   (ucolors.highlight :Function (ucolors.saturation (ucolors.brighten (ucolors.blendColors (syntax.identifier) (. (colors.init :normalColors) :red) (* i 0.1)) 0.1) 0.5) :SKIP :bold)
                   (if (= increase true)
                     (set i (+ i 1))
                     (set i (- i 1)))
                   (when (= i 9)
                     (set increase false))
                   (when (= i 0)
                     (set increase true))))))
