(defun c:lb-area ( / selset pt ent area area-text )
	(setq selset (ssget "_:S" '((0 . "LWPOLYLINE"))))
	(if selset
		(progn
			(setq ent (ssname selset 0))
			(setq area (vla-get-Area (vlax-ename->vla-object ent)))
			(setq area-text (rtos area 2 2))
			(princ (strcat "\nArea: " area-text))
			(setq pt (getpoint "\nSelect point for area label: "))
			(if pt
				(progn
					(command "TEXT" pt 0.25 90 area-text)
					(princ (strcat "\nArea label created: " area-text))
				)
				(princ "\nNo point selected for label.")
			)
		)
		(princ "\nNo polyline selected.")
	)
)