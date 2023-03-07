table 33000919 "Line Type B2B"
{

    Caption = 'Line Type';
    LookupPageID = "Worksheet Line Types B2B";
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Resource Equipment"; Boolean)
        {
            Caption = 'Resource';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Spares & Consumables" then
                    ERROR(Text0001Lbl, FIELDCAPTION("Spares & Consumables"), FIELDCAPTION("Resource Equipment"));
            end;
        }
        field(4; "Spares & Consumables"; Boolean)
        {
            Caption = 'Spares & Consumables';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Resource Equipment" then
                    ERROR(Text0001Lbl, FIELDCAPTION("Resource Equipment"), FIELDCAPTION("Spares & Consumables"));
            end;
        }
        field(5; "Misc. Account"; Code[10])
        {
            Caption = 'Misc. Account';
            TableRelation = "G/L Account"."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                GLAccRec.GET("Misc. Account");
                if (GLAccRec."Account Type".AsInteger() <> 0) or (GLAccRec."Direct Posting" <> true) then
                    ERROR(Text0002Lbl);
            end;
        }
        field(6; Service; Boolean)
        {
            Caption = 'Service';
            DataClassification = CustomerContent;
        }
        field(7; "Resource Person"; Boolean)
        {
            Caption = 'Resource Person';
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

    var
        GLAccRec: Record "G/L Account";
        Text0001Lbl: Label '%1 is already selected, so you can not select %2.', Comment = '%1 = Spares&Consumables,%2 = Resource Equipment';

        Text0002Lbl: Label 'Select a posting account';
}

