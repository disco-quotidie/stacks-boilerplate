
;; sup
;; <add a description here>

;; constants
(define-constant receiver-address 'STRR6WY058401TSWC2ATBSDC6TE7VD2CA4S99QDC)
;;

;; data maps and vars
(define-data-var total-sups uint u0)
(define-map messages principal (string-utf8 500))
;;

;; private functions
(define-public (write-sup (message (string-utf8 500)) (price uinit)) 
    (begin 
        (try! (stx-transfer? price tx-sender receiver-address))

        ;; #[allow(unchecked_data)]
        (map-set messages tx-sender message)

        (var-set total-sups (+ (var-get total-sups) u1))

        (ok "Sup written successfully")
    )
)
;;

;; public functions
(define-read-only (get-sups) (var-get total-sups))
(define-read-only (get-message (who principal)) (map-get? messages who))
;;

