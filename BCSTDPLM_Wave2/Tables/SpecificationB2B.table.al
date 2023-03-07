table 33000898 "Specification B2B"
{

    Caption = 'Specification';

    fields
    {
        field(1; "No."; Integer)
        {
            BlankZero = true;
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if Machine.GET("Machine ID") then
                    "Machine Name" := Machine.Name
                else
                    "Machine Name" := '';
            end;
        }
        field(3; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
        }
        field(4; "Spec. Group ID"; Code[20])
        {
            Caption = 'Spec. Group ID';
            TableRelation = "Specification Group B2B";
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if SpecGroup.GET("Spec. Group ID") then
                    "Specification Group Name" := SpecGroup.Description
                else
                    "Specification Group Name" := '';
            end;
        }
        field(5; "Spec. ID"; Code[20])
        {
            Caption = 'Spec. ID';
            DataClassification = CustomerContent;
            TableRelation = "Specifications B2B";

            trigger OnValidate();
            begin
                if Spec.GET("Spec. ID") then
                    "Specification Name" := Spec.Description
                else
                    "Specification Name" := '';
            end;
        }
        field(6; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(7; "Specification Group Name"; Text[50])
        {
            Caption = 'Specification Group Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Specification Name"; Text[50])
        {
            Caption = 'Specification Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; "Sorting Order"; Integer)
        {
            Caption = 'Sorting Order';
            DataClassification = CustomerContent;
        }
        field(11; Value; Text[250])
        {
            Caption = 'Value';
            DataClassification = CustomerContent;
        }
        field(13; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(14; ID; Code[20])
        {
            Caption = 'ID';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ID <> xRec.ID then begin
                    MachineSetup.GET();
                    NoSeriesMgt.TestManual(MachineSetup."Machine Spec. Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(16; UOM; Code[10])
        {
            CalcFormula = Lookup("Specifications B2B"."Base Unit Of Messure" WHERE(Code = FIELD("Spec. ID")));
            Caption = 'UOM';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; ID, "No.", "Machine ID", "Line No.")
        {
        }
        key(Key2; "Machine ID", "Sorting Order")
        {
        }
        key(Key3; "No.")
        {
        }
        key(Key4; "Specification Group Name", "No.")
        {
        }
        key(Key5; "Line No.")
        {
        }
        key(Key6; "Specification Group Name")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        if ID = '' then begin
            MachineSetup.GET();
            MachineSetup.TESTFIELD("Machine Spec. Nos.");
            NoSeriesMgt.InitSeries(MachineSetup."Machine Spec. Nos.", xRec."No. Series", 0D, ID, "No. Series");
        end;
        if Machine.GET("Machine ID") then
            "Machine Name" := Machine.Name;
    end;

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        Machine: Record "Equipment B2B";
        SpecGroup: Record "Specification Group B2B";
        Spec: Record "Specifications B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure Attachments();
    var
        Attachment: Record "Attachment Documents B2B";
    begin
        Attachment.RESET();
        Attachment.SETRANGE("Table Id", DATABASE::"Equipment B2B");
        Attachment.SETRANGE("Document No.", ID);
        PAGE.RUNMODAL(PAGE::"Attachments Document B2B", Attachment);
    end;
}

