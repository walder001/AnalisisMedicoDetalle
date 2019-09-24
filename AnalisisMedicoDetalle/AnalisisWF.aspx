<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AnalisisWF.aspx.cs" Inherits="AnalisisMedicoDetalle.AnalisisWF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="panel-primary">
            <div class="panel-heading">
             <p class="text-white bg-gradient-primary">Registro de Categoria</p>
            </div>

            <div class="form-group">

            </div>
             
            <div class="panel-body">
                <div class="form-horizontal col-md-12" role="form">
                    <div class="form-group">
                        <label for="PresupuestoTextBox" class="col-md-3 control-label input-sm">AnalisisId</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="AnalisisId" CssClass=" form-control " placeholder="AnalisisId" runat="server" Height="2.5em"></asp:TextBox>
                            <asp:Button ID="BuscarButton" CssClass=" form-control btn btn-primary" runat="server" Text="Buscar"  ValidationGroup="Buscar" OnClick="BuscarButton_Click"/>
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
                            <asp:DropDownList ID="PacienteDropDownList" CssClass=" form-control dropdown" AppendDataBoundItems="true" runat="server" Height="2.5em" OnSelectedIndexChanged="PacienteDropDownList_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="PacienteRequiredFieldValidator" CssClass="col-md-4 col-sm-4" runat="server" ControlToValidate="PacienteDropDownList" Display="Dynamic" ErrorMessage="Porfavor elige un paciente de egreso valido..." ValidationGroup="AgregarDetalle">Porfavor elige un paceinte de egreso valido...</asp:RequiredFieldValidator>
                        </div>
                    </div>

                                        </div>
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#Modal">Open Modal</button>

                   </div>

                    <div class="container">
                  <!-- Trigger the modal with a button -->

                  <!-- Modal -->
                     <div class="modal fade" id="Modal" role="dialog">
                       <!-- Contenido-->
                        <div class="container">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Registro de Paciente</div>

                                <div class="panel-body">
                                    <div class="form-horizontal col-md-12" role="form">
                                        <%--Tipo Analisis Id --%>
                                        <div class="form-group">
                                            <label for="PacienteId" class="col-md-3 control-label input-sm">Paciente Id</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="PacienteId" CssClass=" form-control " placeholder="PacienteId" runat="server" Height="2.5em"></asp:TextBox>
                                                <asp:Button ID="Buscar" CssClass=" form-control btn btn-primary" runat="server" Text="Buscar"  ValidationGroup="Buscar" OnClick="BuscarPaciente_Click"/>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PacienteId" ErrorMessage="*" ValidationGroup="Buscar"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TipoAnalisisId" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)" ValidationGroup="Buscar"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <%-- Descripcion --%>
                                        <div class="form-group">
                                            <label for="Nombre" class="col-md-3 control-label input-sm">Nombre</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="Nombre" CssClass=" form-control " placeholder="Nombre" runat="server" Height="2.5em"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Descripcion" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                          <%-- Balance --%>
                                        <div class="form-group">
                                            <label for="Balance" class="col-md-3 control-label input-sm">Balance</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="Balance" CssClass=" form-control " type = "number" placeholder="Balance" runat="server" Height="2.5em"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Balance" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <%-- Botones --%>
                                <div class="panel-footer">
                                    <div class="text-center">
                                        <div class="form-group" style="display: inline-block">
                                            <asp:Button ID="LiempiarPaciente" CssClass=" col-md-4 col-sm-4 btn btn-primary" runat="server" Text="Limpiar" Height="2.5em" Width="10em" OnClick="LimpiarPaciente_Click"/>
                                            <asp:Button ID="GuardarPaciente" CssClass="col-md-4 col-sm-4 btn btn-success" runat="server" Text="Guardar" Height="2.5em" Width="10em" ValidationGroup="AgregarNuevo"  OnClick="GuardarPaciente_Click" />
                                            <asp:Button ID="EliminarPaciente" CssClass="col-md-4 col-sm-4 btn btn-danger" runat="server" Text="Eliminar" Height="2.5em" Width="10em" ValidationGroup="Eliminar" OnClick="EliminarPaciente_Click" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="col-md-1 col-sm-1" runat="server" ControlToValidate="TipoAnalisisId" ErrorMessage="Es necesario elegir un Presupuesto valido para eliminar" ValidationGroup="Eliminar">Porfavor elige un Presupuesto valido.</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" CssClass="col-md-1 col-sm-1 col-md-offset-1 col-sm-offset-1" runat="server" ControlToValidate="TipoAnalisisId" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d+ " ValidationGroup="Eliminar" Visible="False"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- Final contenido -->
           
                </div>

                 

 
                    <div class="row">
                      
                        <asp:GridView ID="GridView1" runat="server" class="table table-condensed table-bordered table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#0066FF" GridLines="None">
                            <AlternatingRowStyle BackColor="#999999" />
                            <Columns>
                                <asp:BoundField DataField="DetalleAnalsisId" HeaderText="Id" />
                                <asp:BoundField DataField="AnalisisId" HeaderText="Id" />
                                <asp:BoundField DataField="TipoAnalisisId" HeaderText="EgresoId" />
                                <asp:BoundField DataField="Resultado" HeaderText="CategoriaId" />
                            </Columns>
                            <HeaderStyle BackColor="#003366" Font-Bold="True" />
                        </asp:GridView>
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

                    </div>
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#Modal">Open Modal</button>

                   </div>

                    <div class="container">
                  <!-- Trigger the modal with a button -->

                  <!-- Modal -->
                     <div class="modal fade" id="Modal" role="dialog">
                       <!-- Contenido-->
                        <div class="container">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Registro de Categorias</div>

                                <div class="panel-body">
                                    <div class="form-horizontal col-md-12" role="form">
                                        <%--Tipo Analisis Id --%>
                                        <div class="form-group">
                                            <label for="TipoAnalisisId" class="col-md-3 control-label input-sm">Tipo Analisis Id</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="TipoAnalisisId" CssClass=" form-control " placeholder="TipoAnalisisId" runat="server" Height="2.5em"></asp:TextBox>
                                                <asp:Button ID="BuscarTipoAnalisis" CssClass=" form-control btn btn-primary" runat="server" Text="Buscar"  ValidationGroup="Buscar" OnClick="BuscarTipoAnalisis_Click"/>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TipoAnalisisId" ErrorMessage="*" ValidationGroup="Buscar"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TipoAnalisisId" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)" ValidationGroup="Buscar"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <%-- Descripcion --%>
                                        <div class="form-group">
                                            <label for="Descripcion" class="col-md-3 control-label input-sm">Descripcion</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="Descripcion" CssClass=" form-control " placeholder="Descripcion" runat="server" Height="2.5em"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Descripcion" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                           <%-- Precio --%>
                                        <div class="form-group">
                                            <label for="Precio" class="col-md-3 control-label input-sm">Descripcion</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="Precio" CssClass=" form-control " placeholder="Precio" runat="server" Height="2.5em"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Precio" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <%-- Botones --%>
                                <div class="panel-footer">
                                    <div class="text-center">
                                        <div class="form-group" style="display: inline-block">
                                            <asp:Button ID="LimpiarTipoAnalisis" CssClass=" col-md-4 col-sm-4 btn btn-primary" runat="server" Text="Limpiar" Height="2.5em" Width="10em" OnClick="LimpiarTipoAnalisis_Click"/>
                                            <asp:Button ID="GuardarTipoAnalisis" CssClass="col-md-4 col-sm-4 btn btn-success" runat="server" Text="Guardar" Height="2.5em" Width="10em" ValidationGroup="AgregarNuevo"  OnClick="GuardarTipoAnalisis_Click" />
                                            <asp:Button ID="EliminarTipoAnalisis" CssClass="col-md-4 col-sm-4 btn btn-danger" runat="server" Text="Eliminar" Height="2.5em" Width="10em" ValidationGroup="Eliminar" OnClick="EliminarTipoAnalisis_Click" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" CssClass="col-md-1 col-sm-1" runat="server" ControlToValidate="TipoAnalisisId" ErrorMessage="Es necesario elegir un Presupuesto valido para eliminar" ValidationGroup="Eliminar">Porfavor elige un Presupuesto valido.</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="col-md-1 col-sm-1 col-md-offset-1 col-sm-offset-1" runat="server" ControlToValidate="TipoAnalisisId" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d+ " ValidationGroup="Eliminar" Visible="False"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- Final contenido -->
           
                </div>

                    <div class="form-group">
                        <label for="Monto" class="col-md-3 control-label input-sm">Monto</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="MontoTextBox" CssClass=" form-control " placeholder="Monto" runat="server" Height="2.5em"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="AnalisisId" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)" ValidationGroup="Buscar"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                      <div class="form-group">
                        <label for="Balance" class="col-md-3 control-label input-sm">Monto</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="BalanceTextBox" CssClass=" form-control " placeholder="Balance" runat="server" Height="2.5em"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="AnalisisId" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)" ValidationGroup="Buscar"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ResultadoTextBox" class="col-md-3 control-label input-sm">Resultado</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="ResultadoTextBox" CssClass=" form-control " placeholder="Resultado" runat="server" ValidationGroup="AgregarDetalle" Height="2.5em"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ResultadoRequiredFieldValidator2" runat="server" ControlToValidate="ResultadoTextBox" Display="Dynamic" ErrorMessage="Porfavor digite un monto valido..." ValidationGroup="AgregarDetalle">*</asp:RequiredFieldValidator>
                            <asp:Button ID="AgregarButton" CssClass=" form-control btn btn-primary" runat="server" Text="Agregar" Height="2.5em" ValidationGroup="AgregarDetalle" OnClick="AgregarButton_Click1" />
                            <!---<asp:RegularExpressionValidator ID="MontoRegularExpressionValidator" runat="server" ControlToValidate="ResultadoTextBox" ErrorMessage="Porfavor ingrese un numero" ValidationExpression="(/^[A-Z]+$/i)" ValidationGroup="AgregarDetalle"></asp:RegularExpressionValidator>--->
                        </div>
                    </div>

                    
 
                    <div class="row">
                      
                        <asp:GridView ID="DetalleGridView" runat="server" class="table table-condensed table-bordered table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#0066FF" GridLines="None">
                            <AlternatingRowStyle BackColor="#999999" />
                            <Columns>
                                <asp:BoundField DataField="DetalleAnalsisId" HeaderText="Id" />
                                <asp:BoundField DataField="AnalisisId" HeaderText="Id" />
                                <asp:BoundField DataField="TipoAnalisisId" HeaderText="EgresoId" />
                                <asp:BoundField DataField="Resultado" HeaderText="CategoriaId" />
                            </Columns>
                            <HeaderStyle BackColor="#003366" Font-Bold="True" />
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

</asp:Content>
