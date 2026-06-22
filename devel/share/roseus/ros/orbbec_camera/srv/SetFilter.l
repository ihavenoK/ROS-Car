;; Auto-generated. Do not edit!


(when (boundp 'orbbec_camera::SetFilter)
  (if (not (find-package "ORBBEC_CAMERA"))
    (make-package "ORBBEC_CAMERA"))
  (shadow 'SetFilter (find-package "ORBBEC_CAMERA")))
(unless (find-package "ORBBEC_CAMERA::SETFILTER")
  (make-package "ORBBEC_CAMERA::SETFILTER"))
(unless (find-package "ORBBEC_CAMERA::SETFILTERREQUEST")
  (make-package "ORBBEC_CAMERA::SETFILTERREQUEST"))
(unless (find-package "ORBBEC_CAMERA::SETFILTERRESPONSE")
  (make-package "ORBBEC_CAMERA::SETFILTERRESPONSE"))

(in-package "ROS")





(defclass orbbec_camera::SetFilterRequest
  :super ros::object
  :slots (_filter_name _filter_enable _filter_param ))

(defmethod orbbec_camera::SetFilterRequest
  (:init
   (&key
    ((:filter_name __filter_name) "")
    ((:filter_enable __filter_enable) nil)
    ((:filter_param __filter_param) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _filter_name (string __filter_name))
   (setq _filter_enable __filter_enable)
   (setq _filter_param __filter_param)
   self)
  (:filter_name
   (&optional __filter_name)
   (if __filter_name (setq _filter_name __filter_name)) _filter_name)
  (:filter_enable
   (&optional (__filter_enable :null))
   (if (not (eq __filter_enable :null)) (setq _filter_enable __filter_enable)) _filter_enable)
  (:filter_param
   (&optional __filter_param)
   (if __filter_param (setq _filter_param __filter_param)) _filter_param)
  (:serialization-length
   ()
   (+
    ;; string _filter_name
    4 (length _filter_name)
    ;; bool _filter_enable
    1
    ;; float32[] _filter_param
    (* 4    (length _filter_param)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filter_name
       (write-long (length _filter_name) s) (princ _filter_name s)
     ;; bool _filter_enable
       (if _filter_enable (write-byte -1 s) (write-byte 0 s))
     ;; float32[] _filter_param
     (write-long (length _filter_param) s)
     (dotimes (i (length _filter_param))
       (sys::poke (elt _filter_param i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filter_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filter_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _filter_enable
     (setq _filter_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32[] _filter_param
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _filter_param (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _filter_param i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass orbbec_camera::SetFilterResponse
  :super ros::object
  :slots (_success _message ))

(defmethod orbbec_camera::SetFilterResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass orbbec_camera::SetFilter
  :super ros::object
  :slots ())

(setf (get orbbec_camera::SetFilter :md5sum-) "037b7c075b0fb69f649f20b878a7ce51")
(setf (get orbbec_camera::SetFilter :datatype-) "orbbec_camera/SetFilter")
(setf (get orbbec_camera::SetFilter :request) orbbec_camera::SetFilterRequest)
(setf (get orbbec_camera::SetFilter :response) orbbec_camera::SetFilterResponse)

(defmethod orbbec_camera::SetFilterRequest
  (:response () (instance orbbec_camera::SetFilterResponse :init)))

(setf (get orbbec_camera::SetFilterRequest :md5sum-) "037b7c075b0fb69f649f20b878a7ce51")
(setf (get orbbec_camera::SetFilterRequest :datatype-) "orbbec_camera/SetFilterRequest")
(setf (get orbbec_camera::SetFilterRequest :definition-)
      "string filter_name
bool filter_enable
float32[] filter_param
---
bool success
string message
")

(setf (get orbbec_camera::SetFilterResponse :md5sum-) "037b7c075b0fb69f649f20b878a7ce51")
(setf (get orbbec_camera::SetFilterResponse :datatype-) "orbbec_camera/SetFilterResponse")
(setf (get orbbec_camera::SetFilterResponse :definition-)
      "string filter_name
bool filter_enable
float32[] filter_param
---
bool success
string message
")



(provide :orbbec_camera/SetFilter "037b7c075b0fb69f649f20b878a7ce51")


