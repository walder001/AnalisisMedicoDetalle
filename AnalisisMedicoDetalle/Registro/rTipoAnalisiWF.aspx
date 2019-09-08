<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="rTipoAnalisiWF.aspx.cs" Inherits="AnalisisMedicoDetalle.Registro.rTipoAnalisiWF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">Registro de Categorias</div>

            <div class="panel-body">
                <div class="form-horizontal col-md-12" role="form">

                    <div class="form-group">
                        <label for="PresupuestoTextBox" class="col-md-3 control-label input-sm">Tipo Analisis Id</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TipoAnalisiId" CssClass=" form-control " placeholder="TipoAnalisiId" runat="server" Height="2.5em"></asp:TextBox>
                            <asp:Button ID="BuscarButton" CssClass=" form-control btn btn-primary" runat="server" Text="Buscar"  ValidationGroup="Buscar"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TipoAnalisiId" ErrorMessage="*" ValidationGroup="Buscar"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="IdRegularExpressionValidator" runat="server" ControlToValidate="TipoAnalisiId" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)" ValidationGroup="Buscar"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="Descripcion" class="col-md-3 control-label input-sm">Descripcion</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="Descripcion" CssClass=" form-control " placeholder="Monto" runat="server" Height="2.5em"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ResultadoRequiredFieldValidator2" runat="server" ControlToValidate="Descripcion" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="text-center">
                    <div class="form-group" style="display: inline-block">
                        <asp:Button ID="LimpiarButton" CssClass=" col-md-4 col-sm-4 btn btn-primary" runat="server" Text="Limpiar" Height="2.5em" Width="10em"   />
                        <asp:Button ID="GuardarButton" CssClass="col-md-4 col-sm-4 btn btn-success" runat="server" Text="Guardar" Height="2.5em" Width="10em" ValidationGroup="AgregarNuevo" />
                        <asp:Button ID="EliminarButton" CssClass="col-md-4 col-sm-4 btn btn-danger" runat="server" Text="Eliminar" Height="2.5em" Width="10em" ValidationGroup="Eliminar" />
                        <asp:RequiredFieldValidator ID="EliminarRequiredFieldValidator" CssClass="col-md-1 col-sm-1" runat="server" ControlToValidate="TipoAnalisiId" ErrorMessage="Es necesario elegir un Presupuesto valido para eliminar" ValidationGroup="Eliminar">Porfavor elige un Presupuesto valido.</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EliminarRegularExpressionValidator" CssClass="col-md-1 col-sm-1 col-md-offset-1 col-sm-offset-1" runat="server" ControlToValidate="TipoAnalisiId" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d+ " ValidationGroup="Eliminar" Visible="False"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
