table 33000894 "Specification Template B2B"
{

    Caption = 'Specification Template';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    PMSetup.GET();
                    NoSeriesMgt.TestManual(PMSetup."PM Sepc. Template Nos.");
                    "No. Series" := '';
                end;
            end;

        }
        field(2; "Spec Temp ID"; Code[20])
        {
            Caption = 'Spec Temp ID';
            TableRelation = "Specification Templates B2B";
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if SpecTemplates.GET("Spec Temp ID") then
                    "Template Name" := SpecTemplates.Description
                else
                    "Template Name" := '';
            end;

        }
        field(3; "Spec Group ID"; Code[20])
        {
            Caption = 'Spec Group ID';
            TableRelation = "Specification Group B2B";
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if SpecGroups.GET("Spec Group ID") then
                    "Specification Group Name" := SpecGroups.Description
                else
                    "Specification Group Name" := '';
            end;

        }
        field(4; "Spec ID"; Code[20])
        {
            Caption = 'Spec ID';
            TableRelation = "Specifications B2B";
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if Spec.GET("Spec ID") then
                    "Specification Name" := Spec.Description
                else
                    "Specification Name" := '';
            end;

        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(6; "Template Name"; Text[50])
        {
            Caption = 'Template Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; "Specification Group Name"; Text[50])
        {
            Caption = 'Specification Group Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; "Specification Name"; Text[50])
        {
            Caption = 'Specification Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(10; "Sorting Order"; Integer)
        {
            Caption = 'Sorting Order';
            DataClassification = CustomerContent;
        }
        field(11; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
        key(Key2; "Spec Temp ID", "Spec Group ID", "Sorting Order")
        {
        }
        key(Key3; "Spec Temp ID")
        {
        }
        key(Key4; "Spec Group ID")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        if "No." = '' then begin
            PMSetup.GET();
            PMSetup.TESTFIELD(PMSetup."PM Sepc. Template Nos.");
            NoSeriesMgt.InitSeries(PMSetup."PM Sepc. Template Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        SpecTemp: Record "Specification Template B2B";
        PMSetup: Record "Plant Maintenance Setup B2B";
        Spec: Record "Specifications B2B";
        SpecTemplates: Record "Specification Templates B2B";
        SpecGroups: Record "Specification Group B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(Specoldvalue: Record "Specification Template B2B"): Boolean;
    begin
        SpecTemp := Rec;
        PMSetup.GET();
        PMSetup.TESTFIELD("PM Sepc. Template Nos.");
        if NoSeriesMgt.SelectSeries(PMSetup."PM Sepc. Template Nos.", Specoldvalue."No. Series", SpecTemp."No. Series") then begin
            NoSeriesMgt.SetSeries(SpecTemp."No.");
            Rec := SpecTemp;
            exit(true);
        end;
    end;
}

