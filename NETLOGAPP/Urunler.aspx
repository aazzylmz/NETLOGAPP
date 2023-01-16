<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="NETLOGAPP.Urunler" %>
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
                <button type="button" class="btn btn-outline-primary btn-sm" style="height: 35px; width: 80px; font-weight: bold; padding-right: -1px" data-toggle="modal" id="2" data-target="#PopupUrunSave">
                    Yeni
                </button>
            </div>
        </div>

        <!--Modal Urun Save  Start-->
        <div class="modal fade" id="PopupUrunSave" tabindex="-1" role="dialog" aria-labelledby="UrunSave" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center">Ürün Kayit 
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row m-1">
                            <label for="txtItemCode" class="col-6 p-2 text-primary text-right">Ürün kodu</label>
                            <div class="col-6">
                                <asp:TextBox ID="txtItemCode" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rftxttxtItemCode" runat="server" ValidationGroup="btnSave" ErrorMessage="ürün kodu boş geçilemez" ForeColor="Red" ControlToValidate="txtItemCode" Display="None"></asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="row m-1"> 
                            <label for="txtItemName" class="col-6 p-2 text-primary text-right">Ürün Adı</label>
                            <div class="col-6 mt-1">
                                <asp:TextBox ID="txtItemName" CssClass="form-control"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rftxtItemName" runat="server" ValidationGroup="btnSave" ErrorMessage="ürün adı boş geçilemez" ForeColor="Red" ControlToValidate="txtItemName" Display="None"></asp:RequiredFieldValidator>
                            </div> 
                        </div> 
                         <div class="row m-1"> 
                            <label for="txtItemPrice" class="col-6 p-2 text-primary text-right">Fiyat</label>
                            <div class="col-6 mt-1">
                                <asp:TextBox ID="txtItemPrice" CssClass="form-control"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rftxtItemPrice" runat="server" ValidationGroup="btnSave" ErrorMessage="Fiyat boş geçilemez" ForeColor="Red" ControlToValidate="txtItemPrice" Display="None"></asp:RequiredFieldValidator>
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
            <div class="row">
            <div class="col-lg-12 ">
                <div class="table-responsive">
                    <asp:GridView ID="GrdItem" AutoGenerateColumns="false" DataKeyNames="ID" runat="server" OnRowCommand="GrdCustomer_RowCommand"   >
                        <Columns>
                             <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" CssClass="btn btn-outline-danger"  runat="server" CausesValidation="false" CommandName="Deletes" OnClientClick="return confirm('Silinsin mi?');"
                                        Text="Sil" CommandArgument='<%# Eval("ID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" Visible="false"  />
                            <asp:BoundField DataField="ITEMCODE" HeaderText="Ürün Kodu" />
                            <asp:BoundField DataField="ITEMNAME" HeaderText="ürün Adı" />
                            <asp:BoundField DataField="PRICE" HeaderText="Fiyatı" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
         </div>

</asp:Content>
