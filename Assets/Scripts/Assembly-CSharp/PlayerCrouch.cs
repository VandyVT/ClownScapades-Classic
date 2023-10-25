using System;
using UnityEngine;

// Token: 0x02000029 RID: 41
public class PlayerCrouch : MonoBehaviour
{
	// Token: 0x060000A8 RID: 168 RVA: 0x00003FA3 File Offset: 0x000021A3
	private void Start()
	{
		this.charController = base.gameObject.GetComponent<CharacterController>();
	}

	// Token: 0x060000A9 RID: 169 RVA: 0x00003FB8 File Offset: 0x000021B8
	private void Update()
	{
		if (Input.GetKey(KeyCode.LeftControl))
		{
			if (this.characterInterpolation >= 1f)
			{
				this.characterInterpolation = 1f;
			}
			else
			{
				this.characterInterpolation += this.interpolationChange;
			}
		}
		else if (this.characterInterpolation < 0f)
		{
			this.characterInterpolation = 0f;
		}
		else
		{
			this.characterInterpolation -= this.interpolationChange;
		}
		if (this.characterInterpolation != 0f)
		{
			this.charController.height = Mathf.Lerp(this.standControllerHeight, this.crouchControllerHeight, this.characterInterpolation);
		}
	}

	// Token: 0x04000096 RID: 150
	public CharacterController charController;

	// Token: 0x04000097 RID: 151
	public float standControllerHeight = 2f;

	// Token: 0x04000098 RID: 152
	public float crouchControllerHeight = 1f;

	// Token: 0x04000099 RID: 153
	private float characterInterpolation;

	// Token: 0x0400009A RID: 154
	public float interpolationChange = 0.2f;
}
