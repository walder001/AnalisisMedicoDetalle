<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="rUsuarioWf.aspx.cs" Inherits="AnalisisMedicoDetalle.Registro.rUsuarioWf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="container">
        <div class="panel-primary">
            <div class="panel-heading">
             <p class="text-white bg-gradient-primary">Registro de Usuarios</p>
            </div>
             
            <div class="panel-body">
                <div class="form-horizontal col-md-12" role="form">
                    <%-- UsuarioId --%>
                    <div class="form-group">
                        <label for="PresupuestoTextBox" class="col-md-3 control-label input-sm">AnalisisId</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="UsuarioId" CssClass=" form-control " placeholder="UsuarioId" runat="server" Height="2.5em"></asp:TextBox>
                            <asp:Button ID="BuscarButton" CssClass=" form-control btn btn-primary" runat="server" Text="Buscar"  ValidationGroup="Buscar" OnClick="BuscarButton_Click"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="UsuarioId" ErrorMessage="*" ValidationGroup="Buscar"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="IdRegularExpressionValidator" runat="server" ControlToValidate="UsuarioId" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)" ValidationGroup="Buscar"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="form-group label-floating">
											  <asp:Label ID="Label1" runat="server" class="control-label" Text="Id"></asp:Label>
											   <asp:TextBox ID="TextBox1" runat="server" class="form-control" type = " number " min ="0"  ></asp:TextBox>
											</div>
                                   
                                            <div class="form-group label-floating">
											  <asp:Label ID="Label2" runat="server" class="control-label" Text="Nombres"></asp:Label>
											   <asp:TextBox ID="NombresTextBox" runat="server" class="form-control" MaxLength = " 200 " ></asp:TextBox>
											</div>

                                            <div class="form-group label-floating">
											  <asp:Label ID="Label3" runat="server" class="control-label" Text="Email"></asp:Label>
											   <asp:TextBox ID="EmailTextBox" runat="server" class="form-control" placeholder="Example@Example.com"  ></asp:TextBox>
											</div>

                                             <div class="form-group label-floating">                                            <asp:Label Id="Drop" runat="server" class="control-label" Text="Nivel de Usuario"></asp:Label>                                            <asp:DropDownList ID="DropDownList" CssClass="form-control" runat="server" Width="870px">
                                            <asp:ListItem>Administrador</asp:ListItem>
                                            <asp:ListItem>Venta</asp:ListItem>
                                            <asp:ListItem>Contabilidad</asp:ListItem>                                            </asp:DropDownList>                                            </div>                                            <div class="form-group label-floating">
											  <asp:Label ID="Label4" runat="server" class="control-label" Text="Usuario"></asp:Label>
											   <asp:TextBox ID="UsuarioTextBox" runat="server" class="form-control"  ></asp:TextBox>
											</div>

                                            <div class="form-group label-floating">
											  <asp:Label ID="Label5" runat="server" class="control-label" Text="Clave"></asp:Label>
											   <asp:TextBox ID="ClaveTextBox" runat="server" class="form-control" Type="password"  ></asp:TextBox>
											</div>

                                            <div class="form-group label-floating">
											  <asp:Label ID="Label6" runat="server" class="control-label" Text="Confirmar"></asp:Label>
											   <asp:TextBox ID="ConfirmarTextBox" runat="server" class="form-control"  ></asp:TextBox>
											</div>
                    
 
                </div>
            </div>

            <div class="panel-footer">
                <div class="text-center">
                    <div class="form-group" style="display: inline-block">
                        <asp:Button ID="LimpiarButton" CssClass=" col-md-4 col-sm-4 btn btn-primary" runat="server" Text="Limpiar" Height="2.5em" Width="10em" OnClick="LimpiarButton_Click1"  />
                        <asp:Button ID="GuardarButton" CssClass="col-md-4 col-sm-4 btn btn-success" runat="server" Text="Guardar" Height="2.5em" Width="10em" ValidationGroup="AgregarNuevo" OnClick="GuardarButton_Click"/>
                        <asp:Button ID="EliminarButton" CssClass="col-md-4 col-sm-4 btn btn-danger" runat="server" Text="Eliminar" Height="2.5em" Width="10em" ValidationGroup="Eliminar" OnClick="EliminarButton_Click" />
                        <asp:RequiredFieldValidator ID="EliminarRequiredFieldValidator" CssClass="col-md-1 col-sm-1" runat="server" ControlToValidate="UsuarioId" ErrorMessage="Es necesario elegir un Presupuesto valido para eliminar" ValidationGroup="Eliminar">Porfavor elige un Presupuesto valido.</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EliminarRegularExpressionValidator" CssClass="col-md-1 col-sm-1 col-md-offset-1 col-sm-offset-1" runat="server" ControlToValidate="UsuarioId" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d+ " ValidationGroup="Eliminar" Visible="False"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
