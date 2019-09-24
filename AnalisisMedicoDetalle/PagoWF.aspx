<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PagoWF.aspx.cs" Inherits="AnalisisMedicoDetalle.PagoWF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                        <div class="container">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Registro de Pago</div>

                                <div class="panel-body">
                                    <div class="form-horizontal col-md-12" role="form">
                                        <div class ="row">
                                            <div class ="col-md-3">
                                              <label for="PagoId" class="col-md-3 control-label input-sm">PagoId</label>

                                          </div>
                                            <div class="col-md-6">
                                            <asp:TextBox ID="PagoId" CssClass=" form-control " placeholder="PagoId" runat="server" Height="2.5em"></asp:TextBox>

                                            </div>
                                            <div class="col-md-3">
                                                <asp:Button ID="BuscarAnalisis" CssClass=" form-control btn btn-primary" runat="server" Text="Buscar" ValidationGroup="BuscarAnalisis" OnClick="PagoBuscarAnalisis_Click" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PagoId" ErrorMessage="*" ValidationGroup="Buscar"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PagoId" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)" ValidationGroup="Buscar"></asp:RegularExpressionValidator>
                                            
                                            </div>
                                           </div>
                                       
                                        <%-- Paciente ID --%>
                                        <div class="form-group">
                                            <label for="PacienteId" class="col-md-3 control-label input-sm">Paciente</label>
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="PacienteDropDown" CssClass="form-control input-sm" OnSelectedIndexChanged="AnalisisDropDown_SelectedIndexChanged" OnTextChanged="AnalisisDropDown_TextChanged"></asp:DropDownList>

                                            </div>
                                        </div> 
                                        
                                        <%--Detalle Analisis --%>
                                        <div class="form-group">
                                            <label for="DetalleAnalisis" class="col-md-3 control-label input-sm">Analisis</label>
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="DetalleDropDownList1" CssClass="form-control input-sm" OnSelectedIndexChanged="DetalleDropDownList1_SelectedIndexChanged"></asp:DropDownList>

                                            </div>
                                        </div>
                                              <%--Monto Analisis--%>
                                        <div class="form-group">
                                            <label for="Monto" class="col-md-3 control-label input-sm">Monto</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="Monto" CssClass=" form-control " placeholder="Monto" runat="server" Height="2.5em"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Monto" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                            <%--Monto a pagar--%>
                                        <div class="form-group">
                                            <label for="MontoAPagar" class="col-md-3 control-label input-sm">Monto a Pagar</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="MontoAPagar" CssClass=" form-control " placeholder="MontoAPagar" runat="server" Height="2.5em"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MontoAPagar" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                                                 <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cargar Monto" />
                                                 <asp:Button ID="Pagar" CssClass=" form-control btn btn-primary" runat="server" Text="Agregar" Height="2.5em" ValidationGroup="AgregarDetalle" OnClick="AgregarButton_Click1" />
                                            </div>
                                        </div>
                                            <%--Grid--%>
                                        <div class="table-responsive">
                                            <asp:GridView ID="DatosGridView" runat="server" class="table table-condensed  table-responsive" CellPadding="6" ForeColor="#333333" GridLines="None">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:HyperLinkField ControlStyle-ForeColor="#0094ff"
                                                        HeaderText="Opciones"
                                                        DataNavigateUrlFields="DetallePagoId"
                                                        DataNavigateUrlFormatString="/PagoWF.aspx?Id={0}"
                                                        Text="Eliminar"></asp:HyperLinkField>
                                                </Columns>
                                                <HeaderStyle BackColor="#0094ff" Font-Bold="true" ForeColor="black" />
                                                <RowStyle BackColor="#EFF3FB" />
                                            </asp:GridView>
                                        </div>


                                    </div>

                                </div>
                                <%-- Botones --%>
                                <div class="panel-footer">
                                    <div class="text-center">
                                        <div class="form-group" style="display: inline-block">
                                            <asp:Button ID="LimpiarTipoAnalisis" CssClass=" col-md-4 col-sm-4 btn btn-primary" runat="server" Text="Limpiar" Height="2.5em" Width="10em" OnClick="LimpiarTipoAnalisis_Click"/>
                                            <asp:Button ID="GuardarTipoAnalisis" CssClass="col-md-4 col-sm-4 btn btn-success" runat="server" Text="Guardar" Height="2.5em" Width="10em" ValidationGroup="AgregarNuevo" OnClick="GuardarTipoAnalisis_Click" />
                                            <asp:Button ID="EliminarTipoAnalisis" CssClass="col-md-4 col-sm-4 btn btn-danger" runat="server" Text="Eliminar" Height="2.5em" Width="10em" ValidationGroup="Eliminar" OnClick="EliminarTipoAnalisis_Click"/>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" CssClass="col-md-1 col-sm-1" runat="server" ControlToValidate="PagoId" ErrorMessage="Es necesario elegir un Presupuesto valido para eliminar" ValidationGroup="Eliminar">Porfavor elige un Presupuesto valido.</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="col-md-1 col-sm-1 col-md-offset-1 col-sm-offset-1" runat="server" ControlToValidate="PagoId" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d+ " ValidationGroup="Eliminar" Visible="False"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

</asp:Content>
