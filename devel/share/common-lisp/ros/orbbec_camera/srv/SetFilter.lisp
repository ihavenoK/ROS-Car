; Auto-generated. Do not edit!


(cl:in-package orbbec_camera-srv)


;//! \htmlinclude SetFilter-request.msg.html

(cl:defclass <SetFilter-request> (roslisp-msg-protocol:ros-message)
  ((filter_name
    :reader filter_name
    :initarg :filter_name
    :type cl:string
    :initform "")
   (filter_enable
    :reader filter_enable
    :initarg :filter_enable
    :type cl:boolean
    :initform cl:nil)
   (filter_param
    :reader filter_param
    :initarg :filter_param
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SetFilter-request (<SetFilter-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetFilter-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetFilter-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name orbbec_camera-srv:<SetFilter-request> is deprecated: use orbbec_camera-srv:SetFilter-request instead.")))

(cl:ensure-generic-function 'filter_name-val :lambda-list '(m))
(cl:defmethod filter_name-val ((m <SetFilter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:filter_name-val is deprecated.  Use orbbec_camera-srv:filter_name instead.")
  (filter_name m))

(cl:ensure-generic-function 'filter_enable-val :lambda-list '(m))
(cl:defmethod filter_enable-val ((m <SetFilter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:filter_enable-val is deprecated.  Use orbbec_camera-srv:filter_enable instead.")
  (filter_enable m))

(cl:ensure-generic-function 'filter_param-val :lambda-list '(m))
(cl:defmethod filter_param-val ((m <SetFilter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:filter_param-val is deprecated.  Use orbbec_camera-srv:filter_param instead.")
  (filter_param m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetFilter-request>) ostream)
  "Serializes a message object of type '<SetFilter-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filter_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filter_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'filter_enable) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'filter_param))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'filter_param))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetFilter-request>) istream)
  "Deserializes a message object of type '<SetFilter-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filter_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filter_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'filter_enable) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'filter_param) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'filter_param)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetFilter-request>)))
  "Returns string type for a service object of type '<SetFilter-request>"
  "orbbec_camera/SetFilterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFilter-request)))
  "Returns string type for a service object of type 'SetFilter-request"
  "orbbec_camera/SetFilterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetFilter-request>)))
  "Returns md5sum for a message object of type '<SetFilter-request>"
  "037b7c075b0fb69f649f20b878a7ce51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetFilter-request)))
  "Returns md5sum for a message object of type 'SetFilter-request"
  "037b7c075b0fb69f649f20b878a7ce51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetFilter-request>)))
  "Returns full string definition for message of type '<SetFilter-request>"
  (cl:format cl:nil "string filter_name~%bool filter_enable~%float32[] filter_param~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetFilter-request)))
  "Returns full string definition for message of type 'SetFilter-request"
  (cl:format cl:nil "string filter_name~%bool filter_enable~%float32[] filter_param~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetFilter-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filter_name))
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'filter_param) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetFilter-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetFilter-request
    (cl:cons ':filter_name (filter_name msg))
    (cl:cons ':filter_enable (filter_enable msg))
    (cl:cons ':filter_param (filter_param msg))
))
;//! \htmlinclude SetFilter-response.msg.html

(cl:defclass <SetFilter-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetFilter-response (<SetFilter-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetFilter-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetFilter-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name orbbec_camera-srv:<SetFilter-response> is deprecated: use orbbec_camera-srv:SetFilter-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetFilter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:success-val is deprecated.  Use orbbec_camera-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetFilter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader orbbec_camera-srv:message-val is deprecated.  Use orbbec_camera-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetFilter-response>) ostream)
  "Serializes a message object of type '<SetFilter-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetFilter-response>) istream)
  "Deserializes a message object of type '<SetFilter-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetFilter-response>)))
  "Returns string type for a service object of type '<SetFilter-response>"
  "orbbec_camera/SetFilterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFilter-response)))
  "Returns string type for a service object of type 'SetFilter-response"
  "orbbec_camera/SetFilterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetFilter-response>)))
  "Returns md5sum for a message object of type '<SetFilter-response>"
  "037b7c075b0fb69f649f20b878a7ce51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetFilter-response)))
  "Returns md5sum for a message object of type 'SetFilter-response"
  "037b7c075b0fb69f649f20b878a7ce51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetFilter-response>)))
  "Returns full string definition for message of type '<SetFilter-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetFilter-response)))
  "Returns full string definition for message of type 'SetFilter-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetFilter-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetFilter-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetFilter-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetFilter)))
  'SetFilter-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetFilter)))
  'SetFilter-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFilter)))
  "Returns string type for a service object of type '<SetFilter>"
  "orbbec_camera/SetFilter")