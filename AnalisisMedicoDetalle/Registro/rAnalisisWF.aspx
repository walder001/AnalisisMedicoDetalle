<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="rAnalisisWF.aspx.cs" Inherits="AnalisisMedicoDetalle.Registro.rAnalisisWF" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">
        <div class="panel-primary">
            <div class="panel-heading">
             <p class="text-white bg-gradient-primary">Registro de Categoria</p>
            </div>
             
            <div class="panel-body">
                <div class="form-horizontal col-md-12" role="form">

                    <div class="form-group">
                        <label for="PresupuestoTextBox" class="col-md-3 control-label input-sm">AnalisisId</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="AnalisisId" CssClass=" form-control " placeholder="AnalisisId" runat="server" Height="2.5em"></asp:TextBox>
                            <asp:Button ID="BuscarButton" CssClass=" form-control btn btn-primary" runat="server" Text="Buscar"  ValidationGroup="Buscar"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="AnalisisId" ErrorMessage="*" ValidationGroup="Buscar"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="IdRegularExpressionValidator" runat="server" ControlToValidate="AnalisisId" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)" ValidationGroup="Buscar"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="FechaTextBox" class="col-md-3 control-label input-sm">Fecha</label>
                        <div class="col-md-8">
                             <asp:TextBox ID="FechaTextBox" class="form-control input-sm" TextMode="Date" runat="server"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="FechaRequiredFieldValidator1" ValidationGroup="Guardar" ControlToValidate="FechaTextBox" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                 


                <div class="form-group">
                        <label for="PacientesDropDownList" class="col-md-3 control-label input-sm">Pacientes</label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="PacienteDropDownList" CssClass=" form-control dropdown" AppendDataBoundItems="true" runat="server" Height="2.5em">
                                <asp:ListItem Text="Juan" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="PacienteRequiredFieldValidator" CssClass="col-md-4 col-sm-4" runat="server" ControlToValidate="PacienteDropDownList" Display="Dynamic" ErrorMessage="Porfavor elige un paciente de egreso valido..." ValidationGroup="AgregarDetalle">Porfavor elige un paceinte de egreso valido...</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="TipoDropDownList" class="col-md-3 control-label input-sm">Tipo Analisis</label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="TipoDropDownList" CssClass=" form-control dropdown" AppendDataBoundItems="true" runat="server" Height="2.5em">
                                <asp:ListItem Text="Glisemia" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="TipoRequiredFieldValidator" CssClass="col-md-4 col-sm-4" runat="server" ControlToValidate="TipoDropDownList" Display="Dynamic" ErrorMessage="Porfavor elige un tipo de analsis valido..." ValidationGroup="AgregarDetalle">Porfavor elige un tipo de analsis valido...</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ResultadoTextBox" class="col-md-3 control-label input-sm">Resultado</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="ResultadoTextBox" CssClass=" form-control " placeholder="Monto" runat="server" ValidationGroup="AgregarDetalle" Height="2.5em"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ResultadoRequiredFieldValidator2" runat="server" ControlToValidate="ResultadoTextBox" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                            <asp:Button ID="AgregarButton" CssClass=" form-control btn btn-primary" runat="server" Text="Agregar" Height="2.5em" ValidationGroup="AgregarDetalle" OnClick="AgregarButton_Click1" />
                            <!---<asp:RegularExpressionValidator ID="MontoRegularExpressionValidator" runat="server" ControlToValidate="ResultadoTextBox" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(/^[A-Z]+$/i)" ValidationGroup="AgregarDetalle"></asp:RegularExpressionValidator>--->
                        </div>
                    </div>


                    <div class="row">
                        <asp:GridView ID="DetalleGridView" CssClass=" col-md-offset-4 col-sm-offset-4" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="244px" AutoGenerateColumns="true">
                            <AlternatingRowStyle BackColor="White" />

                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div> 
                </div>
            </div>

            <div class="panel-footer">
                <div class="text-center">
                    <div class="form-group" style="display: inline-block">
                        <asp:Button ID="LimpiarButton" CssClass=" col-md-4 col-sm-4 btn btn-primary" runat="server" Text="Limpiar" Height="2.5em" Width="10em" OnClick="LimpiarButton_Click1"  />
                        <asp:Button ID="GuardarButton" CssClass="col-md-4 col-sm-4 btn btn-success" runat="server" Text="Guardar" Height="2.5em" Width="10em" ValidationGroup="AgregarNuevo" OnClick="GuardarButton_Click"/>
                        <asp:Button ID="EliminarButton" CssClass="col-md-4 col-sm-4 btn btn-danger" runat="server" Text="Eliminar" Height="2.5em" Width="10em" ValidationGroup="Eliminar" OnClick="EliminarButton_Click" />
                        <asp:RequiredFieldValidator ID="EliminarRequiredFieldValidator" CssClass="col-md-1 col-sm-1" runat="server" ControlToValidate="AnalisisId" ErrorMessage="Es necesario elegir un Presupuesto valido para eliminar" ValidationGroup="Eliminar">Porfavor elige un Presupuesto valido.</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EliminarRegularExpressionValidator" CssClass="col-md-1 col-sm-1 col-md-offset-1 col-sm-offset-1" runat="server" ControlToValidate="AnalisisId" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d+ " ValidationGroup="Eliminar" Visible="False"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
