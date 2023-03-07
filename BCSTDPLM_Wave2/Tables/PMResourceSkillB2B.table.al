table 33000936 "PM Resource Skill B2B"
{

    Caption = 'Resource Skill';
    LookupPageID = "PM Resource Skills B2B";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;

            OptionCaption = 'Resource,Service Item Group,Item,Service Item';
            OptionMembers = Resource,"Service Item Group",Item,"Service Item";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            DataClassification = CustomerContent;

            TableRelation = IF (Type = CONST(Resource)) Resource."No."
            ELSE
            IF (Type = CONST("Service Item Group")) "Service Item Group".Code
            ELSE
            IF (Type = CONST(Item)) Item."No."
            ELSE
            IF (Type = CONST("Service Item")) "Service Item"."No.";
        }
        field(3; "Skill Code"; Code[10])
        {
            Caption = 'Skill Code';
            NotBlank = true;
            TableRelation = "Skill Code";
            DataClassification = CustomerContent;


            trigger OnValidate();
            var
            begin
            end;
        }
        field(4; "Assigned From"; Option)
        {
            Caption = 'Assigned From';
            DataClassification = CustomerContent;

            OptionCaption = '" ,Service Item Group,Item"';
            OptionMembers = " ","Service Item Group",Item;
        }
        field(5; "Source Type"; Option)
        {
            Caption = 'Source Type';
            DataClassification = CustomerContent;

            OptionCaption = '" ,Service Item Group,Item"';
            OptionMembers = " ","Service Item Group",Item;
        }
        field(6; "Source Code"; Code[20])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;

        }
        field(7; "Machine No."; Code[20])
        {
            Caption = 'Machine No.';
            NotBlank = true;
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;


            trigger OnValidate();
            begin
                CheckMachines();
            end;
        }
    }

    keys
    {
        key(Key1; Type, "No.", "Skill Code", "Machine No.")
        {
        }
        key(Key2; "Skill Code", Type, "No.")
        {
        }
        key(Key3; "Assigned From")
        {
        }
        key(Key4; "Source Type", "Source Code")
        {
        }
        key(Key5; "Assigned From", "Source Type", "Source Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    var
    begin
        CheckMachines();
    end;

    var
        ResourceSkill: Record "PM Resource Skill B2B";
        Text001Lbl: Label 'Machine No. %1 is already selected.', Comment = '%1 = Machine No.';

    procedure CheckMachines();
    begin
        ResourceSkill.RESET();
        ResourceSkill.SETRANGE("No.", "No.");
        ResourceSkill.SETRANGE("Machine No.", "Machine No.");
        if ResourceSkill.FINDFIRST() then
            ERROR(Text001Lbl, "Machine No.");
    end;
}

