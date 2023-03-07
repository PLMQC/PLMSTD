page 33000894 "Specification Temp Setup B2B"
{

    Caption = 'Specification Template Setup';
    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "Specification Template B2B";
    UsageCategory = Administration;
    ApplicationArea = all;


    layout
    {
        area(content)
        {
            field("Specification Template ID"; SpecTempId)
            {
                Caption = 'Specification Template ID';
                ApplicationArea = all;
                Tooltip = 'Created Specifiaction Template ID need to assign here.';
                TableRelation = "Specification Templates B2B";

                trigger OnValidate();
                begin
                    SpecTempIdOnAfterValidate();
                end;
            }
            field("Specification Template Name"; TemplateName)
            {
                Caption = 'Specification Template Name';
                ApplicationArea = all;
                Tooltip = 'Specification Template name will appear based on the template ID.';
                Editable = false;
            }
            repeater(Control1102152000)
            {
                field("Spec Temp ID"; Rec."Spec Temp ID")
                {
                    ApplicationArea = all;
                    Tooltip = 'Created Specifiaction Template ID need to assign here.';
                    Editable = "Spec Temp IDEditable";
                }
                field("Template Name"; Rec."Template Name")
                {
                    ApplicationArea = all;
                    Tooltip = 'Specification Template name will appear based on the template ID.';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Tooltip = 'It specifies the Status of the Template.';
                    Editable = StatusEditable;
                }
                field("Spec Group ID"; Rec."Spec Group ID")
                {
                    ApplicationArea = all;
                    Tooltip = 'It shows the Specification group ID.';
                    Editable = "Spec Group IDEditable";
                }
                field("Specification Group Name"; Rec."Specification Group Name")
                {
                    ApplicationArea = all;
                    Tooltip = 'Based on Spec Group ID, Group name Will Update.';
                    Editable = false;
                }
                field("Spec ID"; Rec."Spec ID")
                {
                    ApplicationArea = all;
                    Tooltip = 'Specification ID is an Unique Id, Defines against the Specifications.';
                    Editable = "Spec IDEditable";
                }
                field("Specification Name"; Rec."Specification Name")
                {
                    ApplicationArea = all;
                    Tooltip = 'Specification name defines against the Specifications.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    Tooltip = 'This field Displays the Description.';
                    Editable = DescriptionEditable;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Release)
                {
                    Caption = 'Release';
                    ApplicationArea = all;
                    Tooltip = 'It specifies the Status of the Release.';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F11';

                    trigger OnAction();
                    begin

                        SpecificationRec.RESET();
                        SpecificationRec.SETRANGE("Spec Temp ID", SpecTempId);
                        if SpecificationRec.FINDFIRST() then
                            SpecificationRec.MODIFYALL(Status, SpecificationRec.Status::Released, false);

                        MESSAGE(Text001Lbl);
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    ApplicationArea = all;
                    ToolTip = 'It specifies the Status of Reopen.';
                    Image = ReOpen;

                    trigger OnAction();
                    begin

                        SpecificationRec.RESET();
                        SpecificationRec.SETRANGE("Spec Temp ID", SpecTempId);
                        if SpecificationRec.FINDFIRST() then
                            SpecificationRec.MODIFYALL(Status, SpecificationRec.Status::Open, false);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

        if Rec.Status = Rec.Status::Released then begin
            "Spec Temp IDEditable" := false;
            StatusEditable := false;
            "Spec Group IDEditable" := false;
            "Spec IDEditable" := false;
            DescriptionEditable := false;
        end else begin
            "Spec Temp IDEditable" := true;
            StatusEditable := true;
            "Spec Group IDEditable" := true;
            "Spec IDEditable" := true;
            DescriptionEditable := true;
        end;

        SpecTempIdOnAfterValidate();
    end;

    trigger OnInit();
    begin
        DescriptionEditable := true;
        "Spec IDEditable" := true;
        "Spec Group IDEditable" := true;
        "Spec Temp IDEditable" := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin

        Rec."Spec Temp ID" := SpecTempId;
        Rec."Template Name" := TemplateName;

        if SpecTempId = '' then
            ERROR('');
    end;

    trigger OnOpenPage();
    begin
        Rec.SETRANGE("Spec Temp ID", '');
        SpecTempIdOnAfterValidate();
    end;

    var
        SpecificationRec: Record "Specification Template B2B";
        SpecTemplates: Record "Specification Templates B2B";
        SpecTempId: Code[20];
        TemplateName: Code[50];

        [InDataSet]
        "Spec Temp IDEditable": Boolean;
        [InDataSet]
        StatusEditable: Boolean;
        [InDataSet]
        "Spec Group IDEditable": Boolean;
        [InDataSet]
        "Spec IDEditable": Boolean;
        [InDataSet]
        DescriptionEditable: Boolean;
        Text001Lbl: Label 'Scheduled Template is Released';

    local procedure SpecTempIdOnAfterValidate();
    begin

        if SpecTemplates.GET(SpecTempId) then
            TemplateName := SpecTemplates.Description
        else
            TemplateName := '';
        Rec.SETRANGE("Spec Temp ID", SpecTempId);
        CurrPage.UPDATE(false);
    end;

    procedure SetTemplate(var TemplateNameParm: Code[20]);
    begin
        SpecTempId := TemplateNameParm;
        SpecTempIdOnAfterValidate();
    end;
}

