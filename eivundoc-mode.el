;;; eivundoc.el --- Emacs mode made for Eivu's Universal Document Format -*- lexical-binding: t -*-

;; This program is free software: you can redistibure it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later
;; version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; not even the implied warranty of MERCHANTABILITY or FITNESS FOR
;; A PARTICULAR PURPOSE. See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License along with
;; this program. If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; A major mode only really made so that I would personally have an easier time
;; formatting my own documents according to the self-imposed eivundoc-format
;; (Eivu's Universal Document Format). The "Universal" here does not refer to
;; the fact that I expect every single document in existance to follow this
;; format, but rather that my documents as a whole are meant to follow it. Thus
;; it is "Universal" in the context of my own work.


;;; Code;

(define-derived-mode eivundoc-mode text-mode "EivUnDoc"
  "Major mode for writing plain text in the self-imposed Eivu's Universal
Documentation-Format, or EivUnDoc."
  (derived-mode-p 'text-mode)
  (setq-local require-final-newline mode-require-final-newline))

(add-hook 'eivundoc-mode-hook 'auto-fill-mode)
(add-hook 'eivundoc-mode-hook
	  #'(lambda() (set-fill-column 75)))

(defun even (beginning end)
  "automatically justifying the selected text!"
  (interactive "r" )
  (fill-region-as-paragraph beginning end "full"))

(defun lock-window ()
  "locks a buffer to a the active/selected window by calling dedicating
said window to the currently selectedd buffer"
  (interactive)
  (set-window-dedicated-p (selected-window) t))

(provide 'eivundoc-mode)

;;; eivundoc.el ends here
