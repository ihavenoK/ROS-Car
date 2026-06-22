;; Auto-generated. Do not edit!


(when (boundp 'orbbec_camera::SetArrays)
  (if (not (find-package "ORBBEC_CAMERA"))
    (make-package "ORBBEC_CAMERA"))
  (shadow 'SetArrays (find-package "ORBBEC_CAMERA")))
(unless (find-package "ORBBEC_CAMERA::SETARRAYS")
  (make-package "ORBBEC_CAMERA::SETARRAYS"))
(unless (find-package "ORBBEC_CAMERA::SETARRAYSREQUEST")
  (make-package "ORBBEC_CAMERA::SETARRAYSREQUEST"))
(unless (find-package "ORBBEC_CAMERA::SETARRAYSRESPONSE")
  (make-package "ORBBEC_CAMERA::SETARRAYSRESPONSE"))

(in-package "ROS")





(defclass orbbec_camera::SetArraysRequest
  :super ros::object
  :slots (_enable _data_param ))

(defmethod orbbec_camera::SetArraysRequest
  (:init
   (&key
    ((:enable __enable) nil)
    ((:data_param __data_param) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _enable __enable)
   (setq _data_param __data_param)
   self)
  (:enable
   (&optional (__enable :null))
   (if (not (eq __enable :null)) (setq _enable __enable)) _enable)
  (:data_param
   (&optional __data_param)
   (if __data_param (setq _data_param __data_param)) _data_param)
  (:serialization-length
   ()
   (+
    ;; bool _enable
    1
    ;; float32[] _data_param
    (* 4    (length _data_param)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _enable
       (if _enable (write-byte -1 s) (write-byte 0 s))
     ;; float32[] _data_param
     (write-long (length _data_param) s)
     (dotimes (i (length _data_param))
       (sys::poke (elt _data_param i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _enable
     (setq _enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32[] _data_param
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data_param (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data_param i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass orbbec_camera::SetArraysResponse
  :super ros::object
  :slots (_success _message ))

(defmethod orbbec_camera::SetArraysResponse
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

(defclass orbbec_camera::SetArrays
  :super ros::object
  :slots ())

(setf (get orbbec_camera::SetArrays :md5sum-) "5ec206645f78d76502a2effe3ab66933")
(setf (get orbbec_camera::SetArrays :datatype-) "orbbec_camera/SetArrays")
(setf (get orbbec_camera::SetArrays :request) orbbec_camera::SetArraysRequest)
(setf (get orbbec_camera::SetArrays :response) orbbec_camera::SetArraysResponse)

(defmethod orbbec_camera::SetArraysRequest
  (:response () (instance orbbec_camera::SetArraysResponse :init)))

(setf (get orbbec_camera::SetArraysRequest :md5sum-) "5ec206645f78d76502a2effe3ab66933")
(setf (get orbbec_camera::SetArraysRequest :datatype-) "orbbec_camera/SetArraysRequest")
(setf (get orbbec_camera::SetArraysRequest :definition-)
      "bool enable
float32[] data_param
---
bool success
string message
")

(setf (get orbbec_camera::SetArraysResponse :md5sum-) "5ec206645f78d76502a2effe3ab66933")
(setf (get orbbec_camera::SetArraysResponse :datatype-) "orbbec_camera/SetArraysResponse")
(setf (get orbbec_camera::SetArraysResponse :definition-)
      "bool enable
float32[] data_param
---
bool success
string message
")



(provide :orbbec_camera/SetArrays "5ec206645f78d76502a2effe3ab66933")


