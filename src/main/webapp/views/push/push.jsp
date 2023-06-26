<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    let send = {
        init: function () {
            $('#marketingBtn').click(function () {
                send.send();
            });
        },
        send: function () {
            $('#marketingForm').attr({
                'action': '/notification',
                'method': 'post'
            });
            $('#marketingForm').submit();
            alert("성공!");
        }
    }
    $(function () {
        send.init();
    })
</script>
<!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">마케팅 시스템 / </span> 마케팅 PUSH</h4>

              <!-- Basic Layout -->
              <div class="row">
                <div class="col-xl">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0">마케팅 PUSH 시스템</h5>
                      <small class="text-muted float-end">어드민</small>
                    </div>
                    <div class="card-body">
                        <form style="margin-top: 100px" id="marketingForm">
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-fullname">제목</label>
                          <input type="text" class="form-control" id="basic-default-fullname" placeholder="마케팅 제목" name="title"/>
                        </div>

                        <div class="mb-3">
                          <label class="form-label" for="basic-default-message">Message</label>
                          <textarea
                            id="basic-default-message"
                            class="form-control"
                            name="body"
                            placeholder="마케팅 메시지를 작성해주세요"
                          ></textarea>
                        </div>
                        <button type="button" id="marketingBtn" class="btn btn-primary">발송</button>
                      </form>
                    </div>
                  </div>
                </div>

              </div>
            </div>
            <!-- / Content -->



            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>

    <!-- / Layout wrapper -->

