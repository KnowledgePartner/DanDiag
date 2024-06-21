tableextension 50300 "Contact KP" extends Contact
{
    fields
    {
        field(50200; "Customer Department KP"; Code[20])
        {
            DataClassification = AccountData;

            trigger OnLookup()
            var
                Customer: Record Customer;
                ContactBusinessRelation: Record "Contact Business Relation";
                CustomerDepartment: Record "Customer Department KP";
            begin
                if "Company No." = '' then
                    error('Select Company No. first');

                ContactBusinessRelation.SetRange("Contact No.", Rec."Company No.");
                ContactBusinessRelation.SetRange("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
                if ContactBusinessRelation.FindFirst() then begin
                    CustomerDepartment.SetRange(Customer, ContactBusinessRelation."No.");
                    PAGE.RunModal(PAGE::"Customer Department List KP", CustomerDepartment)
                end;
            end;
        }
    }
}