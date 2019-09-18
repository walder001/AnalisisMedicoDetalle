<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cTipoAnalisisWF.aspx.cs" Inherits="AnalisisMedicoDetalle.Consulta.cTipoAnalisisWF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <div class="panel" style = "background-color:#0094ff">
           <div class="panel-heading" style="font-family:Arial Black; text-align:center; font-size:20px;  color:Black" >Consulta de Pago</div>
     </div>
    <div class="container">
        <%--Entradas de las consulta--%>
        <div class="form-group row">
            <label for="Filtro" class="col-sm-1 col-form-label">Filtro</label>
            <div class="col-md-2">
                <asp:DropDownList ID="FiltroDropDown" runat="server" CssClass="form-control input-sm">
                    <asp:ListItem>Todo</asp:ListItem>
                    <asp:ListItem>ID</asp:ListItem>
                    <asp:ListItem>Paciente</asp:ListItem>
                </asp:DropDownList>
            </div>
            <label for="CheckBox" class="col-sm-1 col-form-label">Fecha?</label>
            <div class="col-xs-1">
                <asp:CheckBox runat="server" CssClass="custom-checkbox" ID="CheckBoxFecha" />
            </div>
        </div>

        <div class="col-md-6">
            <asp:TextBox ID="CriterioTextBox" runat="server" class="form-control input-sm" Style="font-size: medium"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:Button ID="BuscarButton" runat="server" Text="Buscar" class="btn btn-primary" OnClick="BuscarButton_click" />
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
                    Text="Editar"></asp:HyperLinkField>
            </Columns>
            <HeaderStyle BackColor="#0094ff" Font-Bold="true" ForeColor="black" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:GridView>
    </div>

            </div>

</asp:Content>
