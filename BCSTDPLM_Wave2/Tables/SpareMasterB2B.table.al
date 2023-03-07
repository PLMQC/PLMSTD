table 33000897 "Spare Master B2B"
{

    Caption = 'Spare Master';
    LookupPageID = "Spare Master List B2B";

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if ID <> xRec.ID then begin
                    MachineSetup.GET();
                    NoSeriesMgt.TestManual(MachineSetup."PM Spare Master Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Component ID"; Code[20])
        {
            Caption = 'Component ID';
            DataClassification = CustomerContent;
        }
        field(3; "Component Name"; Text[50])
        {
            Caption = 'Component Name';
            DataClassification = CustomerContent;
        }
        field(4; Specification; Text[50])
        {
            Caption = 'Specification';
            DataClassification = CustomerContent;
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; ID, "Component ID")
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
            MachineSetup.TESTFIELD("PM Spare Master Nos.");
            NoSeriesMgt.InitSeries(MachineSetup."PM Spare Master Nos.", xRec."No. Series", 0D, ID, "No. Series");
        end;
    end;

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

