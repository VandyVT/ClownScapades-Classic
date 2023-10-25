using System;
using UnityEngine;

// Token: 0x0200002B RID: 43
public class PlayerLook : MonoBehaviour
{
	// Token: 0x060000AE RID: 174 RVA: 0x000040DA File Offset: 0x000022DA
	private void Awake()
	{
		this.xAxisClamp = 0f;
	}

	// Token: 0x060000AF RID: 175 RVA: 0x000040E7 File Offset: 0x000022E7
	private void LockCursor()
	{
		Cursor.visible = true;
	}

	// Token: 0x060000B0 RID: 176 RVA: 0x000040EF File Offset: 0x000022EF
	private void Update()
	{
		this.CameraRotation();
	}

	// Token: 0x060000B1 RID: 177 RVA: 0x00002188 File Offset: 0x00000388
	private void LateUpdate()
	{
	}

	// Token: 0x060000B2 RID: 178 RVA: 0x000040F8 File Offset: 0x000022F8
	private void CameraRotation()
	{
		float d = Input.GetAxisRaw(this.mouseXInputName) * this.mouseSensitivity * Time.deltaTime;
		float num = Input.GetAxisRaw(this.mouseYInputName) * this.mouseSensitivity * Time.deltaTime;
		this.xAxisClamp += num;
		if (this.xAxisClamp > 90f)
		{
			this.xAxisClamp = 90f;
			num = 0f;
			this.ClampXAxisRotationToValue(270f);
		}
		else if (this.xAxisClamp < -90f)
		{
			this.xAxisClamp = -90f;
			num = 0f;
			this.ClampXAxisRotationToValue(90f);
		}
		base.transform.Rotate(Vector3.left * num);
		this.playerBody.Rotate(Vector3.up * d);
	}

	// Token: 0x060000B3 RID: 179 RVA: 0x000041C8 File Offset: 0x000023C8
	private void ClampXAxisRotationToValue(float value)
	{
		Vector3 eulerAngles = base.transform.eulerAngles;
		eulerAngles.x = value;
		base.transform.eulerAngles = eulerAngles;
	}

	// Token: 0x0400009C RID: 156
	[SerializeField]
	private string mouseXInputName;

	// Token: 0x0400009D RID: 157
	[SerializeField]
	private string mouseYInputName;

	// Token: 0x0400009E RID: 158
	[SerializeField]
	private float mouseSensitivity;

	// Token: 0x0400009F RID: 159
	[SerializeField]
	private Transform playerBody;

	// Token: 0x040000A0 RID: 160
	private float xAxisClamp;
}
