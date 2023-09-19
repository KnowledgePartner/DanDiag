codeunit 50200 "DDG Sales Price API"
{

    procedure calcSalesPriceItemCategory(customerNo: Code[20]; itemCategoryCode: Code[20]) ReturnValue: Text
    var
    begin
        ResponseJson := DDGSalesPriceManagement.CalcSalesPriceItemCategory(customerNo, itemCategoryCode);

        ResponseJson.WriteTo(ReturnValue);
    end;

    procedure calcSalesPriceItems(customerNo: Code[20]; items: Text) ReturnValue: Text
    var
        JArray: JsonArray;
    begin

        JArray.ReadFrom(items);
        ResponseJson := DDGSalesPriceManagement.CalcSalesPriceFromItems(CustomerNo, JArray);
        ResponseJson.WriteTo(ReturnValue);
    end;

    procedure Ping(): Text
    begin
        exit('Pong');
    end;

    var
        DDGSalesPriceManagement: Codeunit "DDG Sales Price Management";
        ResponseJson: JsonObject;
}