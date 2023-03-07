table 33000911 "Equipment Location B2B"
{

    Caption = 'Equipment Location';
    LookupPageID = "Equipment Locations B2B";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        Equipment.RESET();
        Equipment.SETRANGE("Machine Location", Code);
        if Equipment.FINDFIRST() then
            ERROR(Text001Lbl);
    end;

    trigger OnRename();
    begin
        Equipment.RESET();
        Equipment.SETRANGE("Machine Location", Code);
        if Equipment.FINDFIRST() then;
        ERROR(Text001Lbl);
    end;

    var
        Equipment: Record "Equipment B2B";
        Text001Lbl: Label 'Equipment location assigned.';
}

