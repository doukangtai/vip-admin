package com.dkt.result;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
public class ResponseBean {

    private String status;
    private String msg;

    public ResponseBean() {
    }

    public ResponseBean(String status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "ResponseBean{" +
                "status='" + status + '\'' +
                ", msg='" + msg + '\'' +
                '}';
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
