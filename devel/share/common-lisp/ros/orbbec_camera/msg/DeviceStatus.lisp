; Auto-generated. Do not edit!


(cl:in-package orbbec_camera-msg)


;//! \htmlinclude DeviceStatus.msg.html

(cl:defclass <DeviceStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (color_frame_rate_cur
    :reader color_frame_rate_cur
    :initarg :color_frame_rate_cur
    :type cl:float
    :initform 0.0)
   (color_frame_rate_avg
    :reader color_frame_rate_avg
    :initarg :color_frame_rate_avg
    :type cl:float
    :initform 0.0)
   (color_frame_rate_min
    :reader color_frame_rate_min
    :initarg :color_frame_rate_min
    :type cl:float
    :initform 0.0)
   (color_frame_rate_max
    :reader color_frame_rate_max
    :initarg :color_frame_rate_max
    :type cl:float
    :initform 0.0)
   (color_delay_ms_cur
    :reader color_delay_ms_cur
    :initarg :color_delay_ms_cur
    :type cl:float
    :initform 0.0)
   (color_delay_ms_avg
    :reader color_delay_ms_avg
    :initarg :color_delay_ms_avg
    :type cl:float
    :initform 0.0)
   (color_delay_ms_min
    :reader color_delay_ms_min
    :initarg :color_delay_ms_min
    :type cl:float
    :initform 0.0)
   (color_delay_ms_max
    :reader color_delay_ms_max
    :initarg :color_delay_ms_max
    :type cl:float
    :initform 0.0)
   (depth_frame_rate_cur
    :reader depth_frame_rate_cur
    :initarg :depth_frame_rate_cur
    :type cl:float
    :initform 0.0)
   (depth_frame_rate_avg
    :reader depth_frame_rate_avg
    :initarg :depth_frame_rate_avg
    :type cl:float
    :initform 0.0)
   (depth_frame_rate_min
    :reader depth_frame_rate_min
    :initarg :depth_frame_rate_min
    :type cl:float
    :initform 0.0)
   (depth_frame_rate_max
    :reader depth_frame_rate_max
    :initarg :depth_frame_rate_max
    :type cl:float
    :initform 0.0)
   (depth_delay_ms_cur
    :reader depth_delay_ms_cur
    :initarg :depth_delay_ms_cur
    :type cl:float
    :initform 0.0)
   (depth_delay_ms_avg
    :reader depth_delay_ms_avg
    :initarg :depth_delay_ms_avg
    :type cl:float
    :initform 0.0)
   (depth_delay_ms_min
    :reader depth_delay_ms_min
    :initarg :depth_delay_ms_min
    :type cl:float
    :initform 0.0)
   (depth_delay_ms_max
    :reader depth_delay_ms_max
    :initarg :depth_delay_ms_max
    :type cl:float
    :initform 0.0)
   (device_online
    :reader device_online
    :initarg :device_online
    :type cl:boolean
    :initform cl:nil)
   (connection_type
    :reader connection_type
    :initarg :connection_type
    :type cl:string
    :initform "")
   (customer_calibration_ready
    :reader customer_calibration_ready
    :initarg :customer_calibration_ready
    :type cl:boolean
    :initform cl:nil)
   (calibration_from_factory
    :reader calibration_from_factory
    :initarg :calibration_from_factory
    :type cl:boolean
    :initform cl:nil)
   (calibration_from_launch_param
    :reader calibration_from_launch_param
    :initarg :calibration_from_launch_param
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DeviceStatus (<DeviceStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DeviceStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DeviceStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name orbbec_camera-msg:<DeviceStatus> is deprecated: use orbbec_camera-msg:DeviceStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:header-val is deprecated.  Use orbbec_camera-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'color_frame_rate_cur-val :lambda-list '(m))
(cl:defmethod color_frame_rate_cur-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:color_frame_rate_cur-val is deprecated.  Use orbbec_camera-msg:color_frame_rate_cur instead.")
  (color_frame_rate_cur m))

(cl:ensure-generic-function 'color_frame_rate_avg-val :lambda-list '(m))
(cl:defmethod color_frame_rate_avg-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:color_frame_rate_avg-val is deprecated.  Use orbbec_camera-msg:color_frame_rate_avg instead.")
  (color_frame_rate_avg m))

(cl:ensure-generic-function 'color_frame_rate_min-val :lambda-list '(m))
(cl:defmethod color_frame_rate_min-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:color_frame_rate_min-val is deprecated.  Use orbbec_camera-msg:color_frame_rate_min instead.")
  (color_frame_rate_min m))

(cl:ensure-generic-function 'color_frame_rate_max-val :lambda-list '(m))
(cl:defmethod color_frame_rate_max-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:color_frame_rate_max-val is deprecated.  Use orbbec_camera-msg:color_frame_rate_max instead.")
  (color_frame_rate_max m))

(cl:ensure-generic-function 'color_delay_ms_cur-val :lambda-list '(m))
(cl:defmethod color_delay_ms_cur-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:color_delay_ms_cur-val is deprecated.  Use orbbec_camera-msg:color_delay_ms_cur instead.")
  (color_delay_ms_cur m))

(cl:ensure-generic-function 'color_delay_ms_avg-val :lambda-list '(m))
(cl:defmethod color_delay_ms_avg-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:color_delay_ms_avg-val is deprecated.  Use orbbec_camera-msg:color_delay_ms_avg instead.")
  (color_delay_ms_avg m))

(cl:ensure-generic-function 'color_delay_ms_min-val :lambda-list '(m))
(cl:defmethod color_delay_ms_min-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:color_delay_ms_min-val is deprecated.  Use orbbec_camera-msg:color_delay_ms_min instead.")
  (color_delay_ms_min m))

(cl:ensure-generic-function 'color_delay_ms_max-val :lambda-list '(m))
(cl:defmethod color_delay_ms_max-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:color_delay_ms_max-val is deprecated.  Use orbbec_camera-msg:color_delay_ms_max instead.")
  (color_delay_ms_max m))

(cl:ensure-generic-function 'depth_frame_rate_cur-val :lambda-list '(m))
(cl:defmethod depth_frame_rate_cur-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:depth_frame_rate_cur-val is deprecated.  Use orbbec_camera-msg:depth_frame_rate_cur instead.")
  (depth_frame_rate_cur m))

(cl:ensure-generic-function 'depth_frame_rate_avg-val :lambda-list '(m))
(cl:defmethod depth_frame_rate_avg-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:depth_frame_rate_avg-val is deprecated.  Use orbbec_camera-msg:depth_frame_rate_avg instead.")
  (depth_frame_rate_avg m))

(cl:ensure-generic-function 'depth_frame_rate_min-val :lambda-list '(m))
(cl:defmethod depth_frame_rate_min-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:depth_frame_rate_min-val is deprecated.  Use orbbec_camera-msg:depth_frame_rate_min instead.")
  (depth_frame_rate_min m))

(cl:ensure-generic-function 'depth_frame_rate_max-val :lambda-list '(m))
(cl:defmethod depth_frame_rate_max-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:depth_frame_rate_max-val is deprecated.  Use orbbec_camera-msg:depth_frame_rate_max instead.")
  (depth_frame_rate_max m))

(cl:ensure-generic-function 'depth_delay_ms_cur-val :lambda-list '(m))
(cl:defmethod depth_delay_ms_cur-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:depth_delay_ms_cur-val is deprecated.  Use orbbec_camera-msg:depth_delay_ms_cur instead.")
  (depth_delay_ms_cur m))

(cl:ensure-generic-function 'depth_delay_ms_avg-val :lambda-list '(m))
(cl:defmethod depth_delay_ms_avg-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:depth_delay_ms_avg-val is deprecated.  Use orbbec_camera-msg:depth_delay_ms_avg instead.")
  (depth_delay_ms_avg m))

(cl:ensure-generic-function 'depth_delay_ms_min-val :lambda-list '(m))
(cl:defmethod depth_delay_ms_min-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:depth_delay_ms_min-val is deprecated.  Use orbbec_camera-msg:depth_delay_ms_min instead.")
  (depth_delay_ms_min m))

(cl:ensure-generic-function 'depth_delay_ms_max-val :lambda-list '(m))
(cl:defmethod depth_delay_ms_max-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:depth_delay_ms_max-val is deprecated.  Use orbbec_camera-msg:depth_delay_ms_max instead.")
  (depth_delay_ms_max m))

(cl:ensure-generic-function 'device_online-val :lambda-list '(m))
(cl:defmethod device_online-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:device_online-val is deprecated.  Use orbbec_camera-msg:device_online instead.")
  (device_online m))

(cl:ensure-generic-function 'connection_type-val :lambda-list '(m))
(cl:defmethod connection_type-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:connection_type-val is deprecated.  Use orbbec_camera-msg:connection_type instead.")
  (connection_type m))

(cl:ensure-generic-function 'customer_calibration_ready-val :lambda-list '(m))
(cl:defmethod customer_calibration_ready-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:customer_calibration_ready-val is deprecated.  Use orbbec_camera-msg:customer_calibration_ready instead.")
  (customer_calibration_ready m))

(cl:ensure-generic-function 'calibration_from_factory-val :lambda-list '(m))
(cl:defmethod calibration_from_factory-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:calibration_from_factory-val is deprecated.  Use orbbec_camera-msg:calibration_from_factory instead.")
  (calibration_from_factory m))

(cl:ensure-generic-function 'calibration_from_launch_param-val :lambda-list '(m))
(cl:defmethod calibration_from_launch_param-val ((m <DeviceStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-msg:calibration_from_launch_param-val is deprecated.  Use orbbec_camera-msg:calibration_from_launch_param instead.")
  (calibration_from_launch_param m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DeviceStatus>) ostream)
  "Serializes a message object of type '<DeviceStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'color_frame_rate_cur))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'color_frame_rate_avg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'color_frame_rate_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'color_frame_rate_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'color_delay_ms_cur))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'color_delay_ms_avg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'color_delay_ms_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'color_delay_ms_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_frame_rate_cur))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_frame_rate_avg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_frame_rate_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_frame_rate_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_delay_ms_cur))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_delay_ms_avg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_delay_ms_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_delay_ms_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'device_online) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'connection_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'connection_type))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'customer_calibration_ready) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'calibration_from_factory) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'calibration_from_launch_param) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DeviceStatus>) istream)
  "Deserializes a message object of type '<DeviceStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'color_frame_rate_cur) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'color_frame_rate_avg) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'color_frame_rate_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'color_frame_rate_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'color_delay_ms_cur) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'color_delay_ms_avg) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'color_delay_ms_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'color_delay_ms_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_frame_rate_cur) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_frame_rate_avg) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_frame_rate_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_frame_rate_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_delay_ms_cur) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_delay_ms_avg) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_delay_ms_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_delay_ms_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'device_online) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'connection_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'connection_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'customer_calibration_ready) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'calibration_from_factory) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'calibration_from_launch_param) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DeviceStatus>)))
  "Returns string type for a message object of type '<DeviceStatus>"
  "orbbec_camera/DeviceStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DeviceStatus)))
  "Returns string type for a message object of type 'DeviceStatus"
  "orbbec_camera/DeviceStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DeviceStatus>)))
  "Returns md5sum for a message object of type '<DeviceStatus>"
  "5cf8d5046efc1ba84cc148313b15c5cc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DeviceStatus)))
  "Returns md5sum for a message object of type 'DeviceStatus"
  "5cf8d5046efc1ba84cc148313b15c5cc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DeviceStatus>)))
  "Returns full string definition for message of type '<DeviceStatus>"
  (cl:format cl:nil "std_msgs/Header header~%~%# --- Color stream ---~%float64 color_frame_rate_cur~%float64 color_frame_rate_avg~%float64 color_frame_rate_min~%float64 color_frame_rate_max~%~%float64 color_delay_ms_cur~%float64 color_delay_ms_avg~%float64 color_delay_ms_min~%float64 color_delay_ms_max~%~%# --- Depth stream ---~%float64 depth_frame_rate_cur~%float64 depth_frame_rate_avg~%float64 depth_frame_rate_min~%float64 depth_frame_rate_max~%~%float64 depth_delay_ms_cur~%float64 depth_delay_ms_avg~%float64 depth_delay_ms_min~%float64 depth_delay_ms_max~%~%# --- Device info ---~%bool device_online~%string connection_type   # e.g. \"USB2.0\", \"USB3.0\", \"GigE\"~%~%# --- Calibration status ---~%bool customer_calibration_ready~%bool calibration_from_factory~%bool calibration_from_launch_param~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DeviceStatus)))
  "Returns full string definition for message of type 'DeviceStatus"
  (cl:format cl:nil "std_msgs/Header header~%~%# --- Color stream ---~%float64 color_frame_rate_cur~%float64 color_frame_rate_avg~%float64 color_frame_rate_min~%float64 color_frame_rate_max~%~%float64 color_delay_ms_cur~%float64 color_delay_ms_avg~%float64 color_delay_ms_min~%float64 color_delay_ms_max~%~%# --- Depth stream ---~%float64 depth_frame_rate_cur~%float64 depth_frame_rate_avg~%float64 depth_frame_rate_min~%float64 depth_frame_rate_max~%~%float64 depth_delay_ms_cur~%float64 depth_delay_ms_avg~%float64 depth_delay_ms_min~%float64 depth_delay_ms_max~%~%# --- Device info ---~%bool device_online~%string connection_type   # e.g. \"USB2.0\", \"USB3.0\", \"GigE\"~%~%# --- Calibration status ---~%bool customer_calibration_ready~%bool calibration_from_factory~%bool calibration_from_launch_param~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DeviceStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     1
     4 (cl:length (cl:slot-value msg 'connection_type))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DeviceStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'DeviceStatus
    (cl:cons ':header (header msg))
    (cl:cons ':color_frame_rate_cur (color_frame_rate_cur msg))
    (cl:cons ':color_frame_rate_avg (color_frame_rate_avg msg))
    (cl:cons ':color_frame_rate_min (color_frame_rate_min msg))
    (cl:cons ':color_frame_rate_max (color_frame_rate_max msg))
    (cl:cons ':color_delay_ms_cur (color_delay_ms_cur msg))
    (cl:cons ':color_delay_ms_avg (color_delay_ms_avg msg))
    (cl:cons ':color_delay_ms_min (color_delay_ms_min msg))
    (cl:cons ':color_delay_ms_max (color_delay_ms_max msg))
    (cl:cons ':depth_frame_rate_cur (depth_frame_rate_cur msg))
    (cl:cons ':depth_frame_rate_avg (depth_frame_rate_avg msg))
    (cl:cons ':depth_frame_rate_min (depth_frame_rate_min msg))
    (cl:cons ':depth_frame_rate_max (depth_frame_rate_max msg))
    (cl:cons ':depth_delay_ms_cur (depth_delay_ms_cur msg))
    (cl:cons ':depth_delay_ms_avg (depth_delay_ms_avg msg))
    (cl:cons ':depth_delay_ms_min (depth_delay_ms_min msg))
    (cl:cons ':depth_delay_ms_max (depth_delay_ms_max msg))
    (cl:cons ':device_online (device_online msg))
    (cl:cons ':connection_type (connection_type msg))
    (cl:cons ':customer_calibration_ready (customer_calibration_ready msg))
    (cl:cons ':calibration_from_factory (calibration_from_factory msg))
    (cl:cons ':calibration_from_launch_param (calibration_from_launch_param msg))
))
