;; Auto-generated. Do not edit!


(when (boundp 'orbbec_camera::DeviceStatus)
  (if (not (find-package "ORBBEC_CAMERA"))
    (make-package "ORBBEC_CAMERA"))
  (shadow 'DeviceStatus (find-package "ORBBEC_CAMERA")))
(unless (find-package "ORBBEC_CAMERA::DEVICESTATUS")
  (make-package "ORBBEC_CAMERA::DEVICESTATUS"))

(in-package "ROS")
;;//! \htmlinclude DeviceStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass orbbec_camera::DeviceStatus
  :super ros::object
  :slots (_header _color_frame_rate_cur _color_frame_rate_avg _color_frame_rate_min _color_frame_rate_max _color_delay_ms_cur _color_delay_ms_avg _color_delay_ms_min _color_delay_ms_max _depth_frame_rate_cur _depth_frame_rate_avg _depth_frame_rate_min _depth_frame_rate_max _depth_delay_ms_cur _depth_delay_ms_avg _depth_delay_ms_min _depth_delay_ms_max _device_online _connection_type _customer_calibration_ready _calibration_from_factory _calibration_from_launch_param ))

(defmethod orbbec_camera::DeviceStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:color_frame_rate_cur __color_frame_rate_cur) 0.0)
    ((:color_frame_rate_avg __color_frame_rate_avg) 0.0)
    ((:color_frame_rate_min __color_frame_rate_min) 0.0)
    ((:color_frame_rate_max __color_frame_rate_max) 0.0)
    ((:color_delay_ms_cur __color_delay_ms_cur) 0.0)
    ((:color_delay_ms_avg __color_delay_ms_avg) 0.0)
    ((:color_delay_ms_min __color_delay_ms_min) 0.0)
    ((:color_delay_ms_max __color_delay_ms_max) 0.0)
    ((:depth_frame_rate_cur __depth_frame_rate_cur) 0.0)
    ((:depth_frame_rate_avg __depth_frame_rate_avg) 0.0)
    ((:depth_frame_rate_min __depth_frame_rate_min) 0.0)
    ((:depth_frame_rate_max __depth_frame_rate_max) 0.0)
    ((:depth_delay_ms_cur __depth_delay_ms_cur) 0.0)
    ((:depth_delay_ms_avg __depth_delay_ms_avg) 0.0)
    ((:depth_delay_ms_min __depth_delay_ms_min) 0.0)
    ((:depth_delay_ms_max __depth_delay_ms_max) 0.0)
    ((:device_online __device_online) nil)
    ((:connection_type __connection_type) "")
    ((:customer_calibration_ready __customer_calibration_ready) nil)
    ((:calibration_from_factory __calibration_from_factory) nil)
    ((:calibration_from_launch_param __calibration_from_launch_param) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _color_frame_rate_cur (float __color_frame_rate_cur))
   (setq _color_frame_rate_avg (float __color_frame_rate_avg))
   (setq _color_frame_rate_min (float __color_frame_rate_min))
   (setq _color_frame_rate_max (float __color_frame_rate_max))
   (setq _color_delay_ms_cur (float __color_delay_ms_cur))
   (setq _color_delay_ms_avg (float __color_delay_ms_avg))
   (setq _color_delay_ms_min (float __color_delay_ms_min))
   (setq _color_delay_ms_max (float __color_delay_ms_max))
   (setq _depth_frame_rate_cur (float __depth_frame_rate_cur))
   (setq _depth_frame_rate_avg (float __depth_frame_rate_avg))
   (setq _depth_frame_rate_min (float __depth_frame_rate_min))
   (setq _depth_frame_rate_max (float __depth_frame_rate_max))
   (setq _depth_delay_ms_cur (float __depth_delay_ms_cur))
   (setq _depth_delay_ms_avg (float __depth_delay_ms_avg))
   (setq _depth_delay_ms_min (float __depth_delay_ms_min))
   (setq _depth_delay_ms_max (float __depth_delay_ms_max))
   (setq _device_online __device_online)
   (setq _connection_type (string __connection_type))
   (setq _customer_calibration_ready __customer_calibration_ready)
   (setq _calibration_from_factory __calibration_from_factory)
   (setq _calibration_from_launch_param __calibration_from_launch_param)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:color_frame_rate_cur
   (&optional __color_frame_rate_cur)
   (if __color_frame_rate_cur (setq _color_frame_rate_cur __color_frame_rate_cur)) _color_frame_rate_cur)
  (:color_frame_rate_avg
   (&optional __color_frame_rate_avg)
   (if __color_frame_rate_avg (setq _color_frame_rate_avg __color_frame_rate_avg)) _color_frame_rate_avg)
  (:color_frame_rate_min
   (&optional __color_frame_rate_min)
   (if __color_frame_rate_min (setq _color_frame_rate_min __color_frame_rate_min)) _color_frame_rate_min)
  (:color_frame_rate_max
   (&optional __color_frame_rate_max)
   (if __color_frame_rate_max (setq _color_frame_rate_max __color_frame_rate_max)) _color_frame_rate_max)
  (:color_delay_ms_cur
   (&optional __color_delay_ms_cur)
   (if __color_delay_ms_cur (setq _color_delay_ms_cur __color_delay_ms_cur)) _color_delay_ms_cur)
  (:color_delay_ms_avg
   (&optional __color_delay_ms_avg)
   (if __color_delay_ms_avg (setq _color_delay_ms_avg __color_delay_ms_avg)) _color_delay_ms_avg)
  (:color_delay_ms_min
   (&optional __color_delay_ms_min)
   (if __color_delay_ms_min (setq _color_delay_ms_min __color_delay_ms_min)) _color_delay_ms_min)
  (:color_delay_ms_max
   (&optional __color_delay_ms_max)
   (if __color_delay_ms_max (setq _color_delay_ms_max __color_delay_ms_max)) _color_delay_ms_max)
  (:depth_frame_rate_cur
   (&optional __depth_frame_rate_cur)
   (if __depth_frame_rate_cur (setq _depth_frame_rate_cur __depth_frame_rate_cur)) _depth_frame_rate_cur)
  (:depth_frame_rate_avg
   (&optional __depth_frame_rate_avg)
   (if __depth_frame_rate_avg (setq _depth_frame_rate_avg __depth_frame_rate_avg)) _depth_frame_rate_avg)
  (:depth_frame_rate_min
   (&optional __depth_frame_rate_min)
   (if __depth_frame_rate_min (setq _depth_frame_rate_min __depth_frame_rate_min)) _depth_frame_rate_min)
  (:depth_frame_rate_max
   (&optional __depth_frame_rate_max)
   (if __depth_frame_rate_max (setq _depth_frame_rate_max __depth_frame_rate_max)) _depth_frame_rate_max)
  (:depth_delay_ms_cur
   (&optional __depth_delay_ms_cur)
   (if __depth_delay_ms_cur (setq _depth_delay_ms_cur __depth_delay_ms_cur)) _depth_delay_ms_cur)
  (:depth_delay_ms_avg
   (&optional __depth_delay_ms_avg)
   (if __depth_delay_ms_avg (setq _depth_delay_ms_avg __depth_delay_ms_avg)) _depth_delay_ms_avg)
  (:depth_delay_ms_min
   (&optional __depth_delay_ms_min)
   (if __depth_delay_ms_min (setq _depth_delay_ms_min __depth_delay_ms_min)) _depth_delay_ms_min)
  (:depth_delay_ms_max
   (&optional __depth_delay_ms_max)
   (if __depth_delay_ms_max (setq _depth_delay_ms_max __depth_delay_ms_max)) _depth_delay_ms_max)
  (:device_online
   (&optional (__device_online :null))
   (if (not (eq __device_online :null)) (setq _device_online __device_online)) _device_online)
  (:connection_type
   (&optional __connection_type)
   (if __connection_type (setq _connection_type __connection_type)) _connection_type)
  (:customer_calibration_ready
   (&optional (__customer_calibration_ready :null))
   (if (not (eq __customer_calibration_ready :null)) (setq _customer_calibration_ready __customer_calibration_ready)) _customer_calibration_ready)
  (:calibration_from_factory
   (&optional (__calibration_from_factory :null))
   (if (not (eq __calibration_from_factory :null)) (setq _calibration_from_factory __calibration_from_factory)) _calibration_from_factory)
  (:calibration_from_launch_param
   (&optional (__calibration_from_launch_param :null))
   (if (not (eq __calibration_from_launch_param :null)) (setq _calibration_from_launch_param __calibration_from_launch_param)) _calibration_from_launch_param)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _color_frame_rate_cur
    8
    ;; float64 _color_frame_rate_avg
    8
    ;; float64 _color_frame_rate_min
    8
    ;; float64 _color_frame_rate_max
    8
    ;; float64 _color_delay_ms_cur
    8
    ;; float64 _color_delay_ms_avg
    8
    ;; float64 _color_delay_ms_min
    8
    ;; float64 _color_delay_ms_max
    8
    ;; float64 _depth_frame_rate_cur
    8
    ;; float64 _depth_frame_rate_avg
    8
    ;; float64 _depth_frame_rate_min
    8
    ;; float64 _depth_frame_rate_max
    8
    ;; float64 _depth_delay_ms_cur
    8
    ;; float64 _depth_delay_ms_avg
    8
    ;; float64 _depth_delay_ms_min
    8
    ;; float64 _depth_delay_ms_max
    8
    ;; bool _device_online
    1
    ;; string _connection_type
    4 (length _connection_type)
    ;; bool _customer_calibration_ready
    1
    ;; bool _calibration_from_factory
    1
    ;; bool _calibration_from_launch_param
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _color_frame_rate_cur
       (sys::poke _color_frame_rate_cur (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _color_frame_rate_avg
       (sys::poke _color_frame_rate_avg (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _color_frame_rate_min
       (sys::poke _color_frame_rate_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _color_frame_rate_max
       (sys::poke _color_frame_rate_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _color_delay_ms_cur
       (sys::poke _color_delay_ms_cur (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _color_delay_ms_avg
       (sys::poke _color_delay_ms_avg (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _color_delay_ms_min
       (sys::poke _color_delay_ms_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _color_delay_ms_max
       (sys::poke _color_delay_ms_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_frame_rate_cur
       (sys::poke _depth_frame_rate_cur (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_frame_rate_avg
       (sys::poke _depth_frame_rate_avg (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_frame_rate_min
       (sys::poke _depth_frame_rate_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_frame_rate_max
       (sys::poke _depth_frame_rate_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_delay_ms_cur
       (sys::poke _depth_delay_ms_cur (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_delay_ms_avg
       (sys::poke _depth_delay_ms_avg (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_delay_ms_min
       (sys::poke _depth_delay_ms_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_delay_ms_max
       (sys::poke _depth_delay_ms_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _device_online
       (if _device_online (write-byte -1 s) (write-byte 0 s))
     ;; string _connection_type
       (write-long (length _connection_type) s) (princ _connection_type s)
     ;; bool _customer_calibration_ready
       (if _customer_calibration_ready (write-byte -1 s) (write-byte 0 s))
     ;; bool _calibration_from_factory
       (if _calibration_from_factory (write-byte -1 s) (write-byte 0 s))
     ;; bool _calibration_from_launch_param
       (if _calibration_from_launch_param (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _color_frame_rate_cur
     (setq _color_frame_rate_cur (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _color_frame_rate_avg
     (setq _color_frame_rate_avg (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _color_frame_rate_min
     (setq _color_frame_rate_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _color_frame_rate_max
     (setq _color_frame_rate_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _color_delay_ms_cur
     (setq _color_delay_ms_cur (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _color_delay_ms_avg
     (setq _color_delay_ms_avg (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _color_delay_ms_min
     (setq _color_delay_ms_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _color_delay_ms_max
     (setq _color_delay_ms_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_frame_rate_cur
     (setq _depth_frame_rate_cur (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_frame_rate_avg
     (setq _depth_frame_rate_avg (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_frame_rate_min
     (setq _depth_frame_rate_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_frame_rate_max
     (setq _depth_frame_rate_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_delay_ms_cur
     (setq _depth_delay_ms_cur (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_delay_ms_avg
     (setq _depth_delay_ms_avg (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_delay_ms_min
     (setq _depth_delay_ms_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_delay_ms_max
     (setq _depth_delay_ms_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _device_online
     (setq _device_online (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _connection_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _connection_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _customer_calibration_ready
     (setq _customer_calibration_ready (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _calibration_from_factory
     (setq _calibration_from_factory (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _calibration_from_launch_param
     (setq _calibration_from_launch_param (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get orbbec_camera::DeviceStatus :md5sum-) "5cf8d5046efc1ba84cc148313b15c5cc")
(setf (get orbbec_camera::DeviceStatus :datatype-) "orbbec_camera/DeviceStatus")
(setf (get orbbec_camera::DeviceStatus :definition-)
      "std_msgs/Header header

# --- Color stream ---
float64 color_frame_rate_cur
float64 color_frame_rate_avg
float64 color_frame_rate_min
float64 color_frame_rate_max

float64 color_delay_ms_cur
float64 color_delay_ms_avg
float64 color_delay_ms_min
float64 color_delay_ms_max

# --- Depth stream ---
float64 depth_frame_rate_cur
float64 depth_frame_rate_avg
float64 depth_frame_rate_min
float64 depth_frame_rate_max

float64 depth_delay_ms_cur
float64 depth_delay_ms_avg
float64 depth_delay_ms_min
float64 depth_delay_ms_max

# --- Device info ---
bool device_online
string connection_type   # e.g. \"USB2.0\", \"USB3.0\", \"GigE\"

# --- Calibration status ---
bool customer_calibration_ready
bool calibration_from_factory
bool calibration_from_launch_param

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :orbbec_camera/DeviceStatus "5cf8d5046efc1ba84cc148313b15c5cc")


