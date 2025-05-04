<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("ret")!=null){
        int ret = (Integer) session.getAttribute("ret");
        if(ret==1){
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
                Procedimento realizado com <strong>Sucesso!</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
<%
        }else if(ret==0){
%>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Erro!</strong> Ocorreu algum erro durante o procedimento, tente novamente.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
<%
        }
        session.removeAttribute("ret");
    }
%>