;; init.scm - runs at startup, after helix.scm is required.
;; See STEEL.md and steel-docs.md in the helix source tree for reference.

(require "helix/configuration.scm")
(require "helix/keymaps.scm")

;; --- forest.hx: docked file tree on the left, toggled with space-e --------
;; https://github.com/Ra77a3l3-jar/forest.hx
(require "forest/forest.scm")

(forest-configure! 'left #:ignore (list ".git" "target" "__pycache__" "node_modules"))
(forest-set-style! 'snacks)

;;@doc
;; Open the tree if it's closed, close it if it's open.
(define (forest-toggle)
  (if (forest-snacks-active?)
      (forest-close)
      (forest-open)))

;; --- steel-pty: terminal instances inside helix, opened with space-t ------
;; https://github.com/mattwparas/steel-pty
(require "steel-pty/term.scm")

;; --- Keybindings ------------------------------------------------------------
;; space-e overrides the built-in file_explorer picker with the docked tree.
;; space-t opens a terminal, space-T hides it.
(keymap (global)
        (normal (space (e ":forest-toggle")
                        (t ":open-term")
                        (T ":hide-terminal"))))
