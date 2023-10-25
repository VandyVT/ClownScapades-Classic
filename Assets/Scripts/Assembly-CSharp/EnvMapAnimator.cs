using System;
using System.Collections;
using TMPro;
using UnityEngine;

// Token: 0x02000039 RID: 57
public class EnvMapAnimator : MonoBehaviour
{
	// Token: 0x060000EE RID: 238 RVA: 0x00004A56 File Offset: 0x00002C56
	private void Awake()
	{
		this.m_textMeshPro = base.GetComponent<TMP_Text>();
		this.m_material = this.m_textMeshPro.fontSharedMaterial;
	}

	// Token: 0x060000EF RID: 239 RVA: 0x00004A75 File Offset: 0x00002C75
	private IEnumerator Start()
	{
		Matrix4x4 matrix = default(Matrix4x4);
		for (;;)
		{
			matrix.SetTRS(Vector3.zero, Quaternion.Euler(Time.time * this.RotationSpeeds.x, Time.time * this.RotationSpeeds.y, Time.time * this.RotationSpeeds.z), Vector3.one);
			this.m_material.SetMatrix("_EnvMatrix", matrix);
			yield return null;
		}
		yield break;
	}

	// Token: 0x040000C5 RID: 197
	public Vector3 RotationSpeeds;

	// Token: 0x040000C6 RID: 198
	private TMP_Text m_textMeshPro;

	// Token: 0x040000C7 RID: 199
	private Material m_material;
}
