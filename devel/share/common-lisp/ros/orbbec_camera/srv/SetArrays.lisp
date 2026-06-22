; Auto-generated. Do not edit!


(cl:in-package orbbec_camera-srv)


;//! \htmlinclude SetArrays-request.msg.html

(cl:defclass <SetArrays-request> (roslisp-msg-protocol:ros-message)
  ((enable
    :reader enable
    :initarg :enable
    :type cl:boolean
    :initform cl:nil)
   (data_param
    :reader data_param
    :initarg :data_param
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SetArrays-request (<SetArrays-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetArrays-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetArrays-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name orbbec_camera-srv:<SetArrays-request> is deprecated: use orbbec_camera-srv:SetArrays-request instead.")))

(cl:ensure-generic-function 'enable-val :lambda-list '(m))
(cl:defmethod enable-val ((m <SetArrays-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:enable-val is deprecated.  Use orbbec_camera-srv:enable instead.")
  (enable m))

(cl:ensure-generic-function 'data_param-val :lambda-list '(m))
(cl:defmethod data_param-val ((m <SetArrays-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:data_param-val is deprecated.  Use orbbec_camera-srv:data_param instead.")
  (data_param m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetArrays-request>) ostream)
  "Serializes a message object of type '<SetArrays-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enable) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data_param))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'data_param))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetArrays-request>) istream)
  "Deserializes a message object of type '<SetArrays-request>"
    (cl:setf (cl:slot-value msg 'enable) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data_param) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data_param)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetArrays-request>)))
  "Returns string type for a service object of type '<SetArrays-request>"
  "orbbec_camera/SetArraysRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetArrays-request)))
  "Returns string type for a service object of type 'SetArrays-request"
  "orbbec_camera/SetArraysRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetArrays-request>)))
  "Returns md5sum for a message object of type '<SetArrays-request>"
  "5ec206645f78d76502a2effe3ab66933")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetArrays-request)))
  "Returns md5sum for a message object of type 'SetArrays-request"
  "5ec206645f78d76502a2effe3ab66933")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetArrays-request>)))
  "Returns full string definition for message of type '<SetArrays-request>"
  (cl:format cl:nil "bool enable~%float32[] data_param~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetArrays-request)))
  "Returns full string definition for message of type 'SetArrays-request"
  (cl:format cl:nil "bool enable~%float32[] data_param~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetArrays-request>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data_param) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetArrays-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetArrays-request
    (cl:cons ':enable (enable msg))
    (cl:cons ':data_param (data_param msg))
))
;//! \htmlinclude SetArrays-response.msg.html

(cl:defclass <SetArrays-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SetArrays-response (<SetArrays-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetArrays-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetArrays-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name orbbec_camera-srv:<SetArrays-response> is deprecated: use orbbec_camera-srv:SetArrays-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetArrays-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:success-val is deprecated.  Use orbbec_camera-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetArrays-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:message-val is deprecated.  Use orbbec_camera-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetArrays-response>) ostream)
  "Serializes a message object of type '<SetArrays-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetArrays-response>) istream)
  "Deserializes a message object of type '<SetArrays-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetArrays-response>)))
  "Returns string type for a service object of type '<SetArrays-response>"
  "orbbec_camera/SetArraysResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetArrays-response)))
  "Returns string type for a service object of type 'SetArrays-response"
  "orbbec_camera/SetArraysResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetArrays-response>)))
  "Returns md5sum for a message object of type '<SetArrays-response>"
  "5ec206645f78d76502a2effe3ab66933")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetArrays-response)))
  "Returns md5sum for a message object of type 'SetArrays-response"
  "5ec206645f78d76502a2effe3ab66933")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetArrays-response>)))
  "Returns full string definition for message of type '<SetArrays-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetArrays-response)))
  "Returns full string definition for message of type 'SetArrays-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetArrays-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetArrays-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetArrays-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetArrays)))
  'SetArrays-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetArrays)))
  'SetArrays-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetArrays)))
  "Returns string type for a service object of type '<SetArrays>"
  "orbbec_camera/SetArrays")