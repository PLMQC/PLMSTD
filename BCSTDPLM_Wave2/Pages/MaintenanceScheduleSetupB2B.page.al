page 33000898 "Maintenance Schedule Setup B2B"
{

    AutoSplitKey = true;
    Caption = 'Maintenance Schedule Setup';
    DelayedInsert = true;
    MultipleNewLines = false;
    PageType = Worksheet;
    SourceTable = "Maintenance Schedule Part B2B";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(TemplateNo; TemplateNoGVar)
                {
                    Caption = 'Maintenance SubAssembly';
                    ApplicationArea = all;
                    ToolTip = 'Maintenance Sub Assembly need to Setup.';
                    TableRelation = "Maint. Schedule Template B2B";

                    trigger OnValidate();
                    begin
                        TemplateNoOnAfterValidate();
                    end;
                }
                field(TemplateName; TemplateNameGVar)
                {
                    Caption = 'Template Name';
                    ApplicationArea = all;
                    ToolTip = 'Defines Template name';
                    Editable = false;
                }
            }
            repeater(Control1102152000)
            {
                field("Component ID"; Rec."Component ID")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Component ID Need to Specify.';
                }
                field("Component Name"; Rec."Component Name")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Based on Componet ID, Component Name Populates here.';
                }
                field(Frequency; Rec."Frequency ID")
                {
                    ApplicationArea = all;
                    Tooltip = 'Frequency Must be specified Here.';
                }
                field("Frequency Description"; Rec."Frequency Name")
                {
                    ApplicationArea = all;
                    Tooltip = 'Frequency Description will populate based on ID.';
                }
                field("Notice Days"; Rec."Notice Days")
                {
                    ApplicationArea = all;
                    Tooltip = 'It Defines the Number of notice days.';





                }

                field("Date Interval"; Rec."Date Interval")
                {
                    ApplicationArea = all;
                    Tooltip = 'Need to Specify the Date Interval.';
                }
                field("Resource Cost"; Rec."Resource Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Resource cost.';
                }
                field("Planned Res.Person Cost"; Rec."Planned Res.Person Cost")
                {
                    ToolTip = 'It Defines the Resource(Person) cost.';
                    ApplicationArea = all;
                }
                field("Spares Cost"; Rec."Spares Cost")
                {
                    ToolTip = 'It Defines the Spares cost.';
                    ApplicationArea = all;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Total cost.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Maintenance type.';
                }
                field("Hrs Required"; Rec."Hrs Required")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'It Defines the No Of Hrs.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Planned Worksheet")
                {
                    Caption = 'Planned Worksheet';
                    ApplicationArea = all;
                    Tooltip = 'Planned Worksheet is Defined in Maintenance Schdule Setup. From here User can get Defined Maitenance worksheet lines.';
                    Image = PlanningWorksheet;
                    RunObject = Page "Maint. Schedule Subform B2B";
                    RunPageLink = "Schedule Template ID" = FIELD("No.");
                }
                action("Procedure")
                {
                    Caption = 'Procedure';
                    ApplicationArea = all;
                    Tooltip = 'Procedure can be defined in The maintenance Schedule Template. it carried out the maintenance lines to Job card level.';
                    Image = AddWatch;
                    RunObject = Page "Maint. Sched. Line Proc B2B";
                    RunPageLink = "Machine Sched. Part No." = FIELD("No.");
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Attachment)
                {
                    Caption = 'Attachment';
                    ApplicationArea = all;
                    Tooltip = 'Here related Information can be attached.';
                    Image = Attach;

                    trigger OnAction();
                    begin
                        Rec.Attachments();
                    end;
                }
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    ApplicationArea = all;
                    Tooltip = 'From here Document can be released.';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F11';

                    trigger OnAction();
                    begin
                        RelPLMDoc.ReleaseMaintSchPart(Rec);
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Tooltip = 'From here Document can be reopened.';
                    Image = ReOpen;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        RelPLMDoc.ReopenMaintSchPart(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        TemplateNoOnAfterValidate();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        Rec."Maint. Sch. Template ID" := TemplateNoGVar;
        Rec."Maint. Sch. Template Name" := TemplateNameGVar;
        if TemplateNoGVar = '' then
            ERROR(Text000Lbl)
    end;

    trigger OnOpenPage();
    begin
        Rec.SETRANGE("Maint. Sch. Template ID", Text001Lbl);
        TemplateNoOnAfterValidate();
    end;

    var
        MaintSchTemplate: Record "Maint. Schedule Template B2B";
        RelPLMDoc: Codeunit "Release PLM Document B2B";
        TemplateNoGVar: Code[20];
        TemplateNameGVar: Code[50];
        Text000Lbl: Label 'You can not enter records with out template number.';
        Text001Lbl: Label 'EMPTY DATA';

    local procedure TemplateNoOnAfterValidate();
    begin
        if MaintSchTemplate.GET(TemplateNoGVar) then
            TemplateNameGVar := MaintSchTemplate.Description
        else
            TemplateNameGVar := '';

        Rec.SETRANGE("Maint. Sch. Template ID", TemplateNoGVar);
        Rec.SETRANGE("Machine ID", '');
        CurrPage.UPDATE(false);
    end;

    procedure SetTemplate(var ScTemplate: Code[20]);
    begin
        TemplateNoGVar := ScTemplate;
        TemplateNoOnAfterValidate();
    end;
}