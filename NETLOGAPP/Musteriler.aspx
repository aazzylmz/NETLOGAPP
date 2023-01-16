<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Musteriler.aspx.cs" Inherits="NETLOGAPP.Musteriler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        window.alert = function (txt, title) {

            var a = [];
            a = txt;
            this.console.log(txt);
            Notiflix.Notify.Failure(txt, { timeout: 4000 });
        }
      
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row m-2">
            <div class="col-lg-1 col-2">
                <button type="button" class="btn btn-outline-primary btn-sm" style="height: 35px; width: 80px; font-weight: bold; padding-right: -1px" data-toggle="modal" id="2" data-target="#PopupBayiSave">
                    Yeni
                </button>
            </div>
        </div>

            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center">Müşteri Kayit 
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row m-1">
                            <label for="txtBayiAdi" class="col-6 p-2 text-primary text-right">Müşteri Adi</label>
                            <div class="col-6">
                                <asp:TextBox ID="txtCustomerName" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rftxtCustomerName" runat="server" ValidationGroup="btnSave" ErrorMessage="Müşteri adi boş geçilemez" ForeColor="Red" ControlToValidate="txtCustomerName" Display="None"></asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="row m-1"> 
                            <label for="txtAdress" class="col-6 p-2 text-primary text-right">Adress</label>
                            <div class="col-6 mt-1">
                                <asp:TextBox ID="txtAdress" CssClass="form-control"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rftxtAdress" runat="server" ValidationGroup="btnSave" ErrorMessage="Adress boş geçilemez" ForeColor="Red" ControlToValidate="txtAdress" Display="None"></asp:RequiredFieldValidator>
                            </div> 
                        </div> 

                    </div>
                    <asp:ValidationSummary ID="vdSummary" runat="server" ValidationGroup="btnSave" ShowMessageBox="true" ShowSummary="false" />
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-outline-success" ValidationGroup="btnSave" Text="Oluştur" OnClick="btnSave_Click" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                    </div>
                </div>
            </div>
        </div>
    <!--End-->

        <div class="row">
            <div class="col-lg-12 ">
                <div class="table-responsive">
                    <asp:GridView ID="GrdCustomer" AutoGenerateColumns="false" DataKeyNames="ID" runat="server" OnRowCommand="GrdCustomer_RowCommand"   >
                        <Columns>
                             <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" CssClass="btn btn-outline-danger"  runat="server" CausesValidation="false" CommandName="Deletes" OnClientClick="return confirm('Silinsin mi?');"
                                        Text="Sil" CommandArgument='<%# Eval("ID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" Visible="false"  />
                            <asp:BoundField DataField="NAMEUSERNAME" HeaderText="Müşteri Adı" />
                            <asp:BoundField DataField="ADRESS" HeaderText="Adres" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
