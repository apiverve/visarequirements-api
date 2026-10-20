declare module '@apiverve/visarequirements' {
  export interface visarequirementsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface visarequirementsResponse {
    status: string;
    error: string | null;
    data: VisaRequirementsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface VisaRequirementsData {
      passport:              null | string;
      passportName:          null | string;
      destination:           null | string;
      destinationName:       null | string;
      requirement:           null | string;
      requirementLabel:      null | string;
      visaRequiredInAdvance: boolean | null;
      allowedStayDays:       number | null;
      allowedStay:           null | string;
      updatedAt:             Date | null;
  }

  export default class visarequirementsWrapper {
    constructor(options: visarequirementsOptions);

    execute(callback: (error: any, data: visarequirementsResponse | null) => void): Promise<visarequirementsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: visarequirementsResponse | null) => void): Promise<visarequirementsResponse>;
    execute(query?: Record<string, any>): Promise<visarequirementsResponse>;
  }
}
