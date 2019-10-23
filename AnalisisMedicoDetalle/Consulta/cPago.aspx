<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="cPago.aspx.cs" Inherits="AnalisisMedicoDetalle.Consulta.cPago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <div class="panel" style = "background-color:#0094ff">
           <div class="panel-heading" style="font-family:Arial Black; text-align:center; font-size:20px;  color:Black" >Consulta de Pago</div>
     </div>

      <%--Entradas de las consulta--%>
        <div class="form-group row">
              <label for="Filtro" class="col-sm-1 col-form-label">Filtro</label>
            <div class="col-md-2">
                    <asp:DropDownList ID="FiltroDropDown" runat="server" CssClass="form-control input-sm" >
                        <asp:ListItem>Todo</asp:ListItem>
                        <asp:ListItem>ID</asp:ListItem>
                        <asp:ListItem>AnalisisId</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <label for="CheckBox" class="col-sm-1 col-form-label">Fecha</label>
                <div class="col-xs-1">
                    <asp:CheckBox runat="server" CssClass="custom-checkbox" ID="CheckBoxFecha" />
                </div>
            </div>
            
                <div class="col-md-6">
                     <asp:TextBox ID="CriterioTextBox" runat="server"  class="form-control input-sm" style="font-size:medium"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="BuscarButton" runat="server" Text="Buscar" class="btn btn-primary" OnClick="BuscarButton_click"/>
                </div>
            </div>
         <br/>
         <br/>

         <%--Fechas para consulta--%>
        <div class="form-group">
            <div class="col-md-12">
                    <label for="DesdeTextBox" class="col-md-1 control-label input-sm" style="font-size: medium">Desde</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="DesdeTextBox" TextMode="Date" runat="server" class="form-control input-sm" Style="font-size: medium" Visible="true" ></asp:TextBox>
                    </div>

                    <label for="HastaTextBox" class="col-md-1 control-label input-sm" style="font-size: medium">Hasta</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="HastaTextBox" TextMode="Date" runat="server" class="form-control input-sm" Style="font-size: medium" Visible="true" ></asp:TextBox>
                    </div>
                    <asp:CheckBox ID="FechaCheckBox" runat="server" Checked="True" Visible="False"  />
            </div>
         </div>
        <br/>
        <br/>


        <%--Grid--%>
        <div class="table-responsive">
            <asp:GridView ID="DatosGridView" runat="server" class="table table-condensed  table-responsive" CellPadding="6" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField ControlStyle-ForeColor="#0094ff"
                            HeaderText="Opciones"
                            DataNavigateUrlFields="AnalisisId"
                            DataNavigateUrlFormatString="/Registros/rAnalsis.aspx?Id={0}"
                            Text="Editar">
                        </asp:HyperLinkField>
                    </Columns>
                    <HeaderStyle BackColor="#0094ff" Font-Bold="true" ForeColor="black" />
                    <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>>
          <%--Imprimir--%>
            <div class="card-footer">
                <div class="justify-content-start">
                </div>
            </div>
            <!-- Modal para mi Reporte.// -->
            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" style="max-width: 600px!important; min-width: 720px!important">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">REPORTE Categoria</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <%--Viewer--%>
                            <rsweb:ReportViewer ID="MyReportViewer" runat="server" ProcessingMode="Remote" Height="1000px" Width="1000px">
                                <ServerReport ReportPath="" ReportServerUrl="" />
                            </rsweb:ReportViewer>
                        </div>
                    </div>
                </div>
            </div></div>
                    <div class="form-group" style="display: inline-block">
                        <button type="button" class="btn btn-warning mt-4" data-toggle="modal" data-target=".bd-example-modal-lg">Imprimir</button>
                    </div>
                </asp:Content>
